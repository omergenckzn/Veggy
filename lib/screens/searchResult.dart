import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class searchResult extends StatefulWidget {
  const searchResult({Key? key}) : super(key: key);

  @override
  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<searchResult> {
  @override
  Widget build(BuildContext context) {
    Color pageThemeColor = Color.fromRGBO(76, 175, 80, 1);
    CollectionReference reference =
        FirebaseFirestore.instance.collection('recipes');
    Color themeColor = Color.fromRGBO(76, 175, 80, 1);
    var route = ModalRoute.of(context);
    if (route == null) return CircularProgressIndicator();
    Map data = route.settings.arguments as Map;
    String searchKey = data['searchWord'];
    String searchKeyLow = searchKey.toLowerCase();
    String searchKeySpaceless = searchKeyLow.replaceAll(" ", "");


    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 251, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
                width: 16,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: CircleBorder(),
                padding: EdgeInsets.all(4),
                primary: themeColor, // <-- Button color
                onPrimary: Colors.white, // <-- Splash color
                minimumSize: Size(50.0, 20.0),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'VE',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
            Text(
              'GG',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: themeColor,
                  fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
            Text(
              'Y',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 23,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: Color.fromRGBO(76, 175, 80, 1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(
                          'Search results for',
                          style: TextStyle(
                              fontFamily: "Sfui",
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.09),
                        ),
                        flex: 4,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                          '${searchKey}',
                          style: TextStyle(
                            fontFamily: "Sfui2",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),
                        flex: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 4,
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 65,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.10,
                ),
                child: SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: reference.snapshots(),
                    builder: (context, AsyncSnapshot snapshots) {
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshots.connectionState ==
                          ConnectionState.active) {
                        if (snapshots.hasError) {
                          return CircularProgressIndicator();
                        } else {
                          if (snapshots.hasData) {
                            if (snapshots.data != null) {
                              List<DocumentSnapshot> streamList =
                                  snapshots.data.docs;
                              List<DocumentSnapshot> finalList = streamList.where((element){
                                return element['name'].toLowerCase().replaceAll(" ", "").contains(searchKeySpaceless);
                              }).toList();
                              return SingleChildScrollView(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: finalList.length,
                                    itemBuilder: (context, index) {

                                      return Column(
                                        children: [
                                          Container(
                                            child: SizedBox(
                                              height: MediaQuery.of(context).size.width * 0.18,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0.3,
                                                    primary: Color.fromRGBO(255, 255, 255, 1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(14)
                                                    )
                                                ),
                                                onPressed: () {
                                                  String name = streamList[index]['imageName'];
                                                  FirebaseStorage.instance.ref().child(name).getDownloadURL().then((value) {
                                                    Navigator.pushNamed(context, '/ingredients' ,arguments: {
                                                      'color': pageThemeColor,
                                                      'recipe': finalList[index],
                                                      'imgUrl': value,
                                                      // 'ingredientsUrlList': ingredientsUrlList,
                                                    });
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${finalList[index]['name']}',
                                                      style: TextStyle(
                                                          fontFamily: "Sfui2" ,
                                                          fontWeight: FontWeight.w500,
                                                          color: Color.fromRGBO(43, 43, 43, 1),
                                                          fontSize: MediaQuery.of(context).size.width * 0.041
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width * 0.200,),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        String name = streamList[index]['imageName'];
                                                        FirebaseStorage.instance.ref().child(name).getDownloadURL().then((value) {
                                                          Navigator.pushNamed(context, '/ingredients' ,arguments: {
                                                            'color': pageThemeColor,
                                                            'recipe': finalList[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                        });
                                                      },
                                                      child: Container(
                                                        child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                                                        width: 21,
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0.0,
                                                        shape: CircleBorder(),
                                                        padding: EdgeInsets.all(4),
                                                        primary: themeColor, // <-- Button color
                                                        onPrimary: Colors.white, // <-- Splash color
                                                        minimumSize: Size(50.0, 20.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      );
                                    }),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        }
                      } else {
                        return Text('error');
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//FirebaseFirestore.instance
//                         .collection('recipes')
//                         .where("name", arrayContains: searchKeySpaceless, )
//                         .snapshots(),