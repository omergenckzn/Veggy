import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class dinner extends StatefulWidget {
  const dinner({Key? key}) : super(key: key);

  @override
  _dinnerState createState() => _dinnerState();
}

class _dinnerState extends State<dinner> {
  CollectionReference dinnerRef = FirebaseFirestore.instance.collection('dinnerRecipes');
  Color pageThemeColor = Color.fromRGBO(242, 153, 74, 1);


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/menu_tab');
                },
                icon: new Image.asset('assets/threeline.png'), color: Colors.black),
            SizedBox(width: 15,),
            // Image.asset('assets/veggy_text.png', fit: BoxFit.fitHeight,),
            Text('VE',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.06
              ),),
            Text('GG',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(242, 153, 74, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.06
              ),),
            Text('Y',
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.06
              ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight:  Radius.circular(40)),
                color: pageThemeColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: SizedBox(),flex: 2,),
                    Expanded(child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Dinner?',
                            style: TextStyle(
                                fontFamily: "Sfui",
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: MediaQuery.of(context).size.width * 0.09
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(child: Image.asset('assets/dinner-white.png'),flex: 1,)
                      ],
                    ),flex: 4,),
                    Spacer(flex: 1,),
                    Expanded(child: Text(
                      'Dinner needs to perfect and delightful.\nCheck out these recipes.',
                      style: TextStyle(
                          fontFamily: "Sfui2",
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.043
                      ),
                    ),
                      flex: 6,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Delightfully Meals',
                style: TextStyle(
                    fontFamily: "Sfui",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(43, 43, 43, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.084
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: dinnerRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots){

                    if(snapshots.hasError){
                      return Text('no data');
                    }else {
                      if(snapshots.hasData){

                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots
                              .data.docs;

                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index)  {
                              return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.03),
                                                offset: Offset(0,1),
                                                blurRadius: 14.0
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            //Image.asset(list[index]['imageUrl']),
                                            FutureBuilder(
                                                future: _getImage(context,list[index]['imageName'] ),
                                                builder: (context, snapshot){
                                                  if(snapshot.hasData){
                                                    return Image.network(snapshot.data.toString(), fit: BoxFit.cover,);
                                                  }else{
                                                    return CircularProgressIndicator();
                                                  }
                                                }
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight: FontWeight.w700,
                                                      color: Color.fromRGBO(43, 43, 43, 1),
                                                      fontSize: MediaQuery.of(context).size.width * 0.05
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8,),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(43, 43, 43, 0.7),
                                                  fontSize: MediaQuery.of(context).size.width * 0.041
                                              ),
                                            ),
                                            SizedBox(height: 8,),
                                            Row(
                                              children: [
                                                SizedBox(width: 130,),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]['imageName'];
                                                    FirebaseStorage.instance.ref().child(name).getDownloadURL().then((value) {
                                                      Navigator.pushNamed(context, '/ingredients' ,arguments: {
                                                        'color': pageThemeColor,
                                                        'recipe': list[index],
                                                        'imgUrl': value,
                                                        // 'ingredientsUrlList': ingredientsUrlList,
                                                      });
                                                    });
                                                    // print(list[index].data().toString());
                                                    // await Navigator.pushNamed(context, '/ingredients' ,arguments: {
                                                    //   'color': pageThemeColor,
                                                    //   'recipe': list[index],
                                                    //   'imgurl': url,
                                                    //   // 'ingredientsUrlList': ingredientsUrlList,
                                                    // });
                                                  },
                                                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: pageThemeColor, // <-- Button color
                                                    onPrimary: Colors.white, // <-- Splash color
                                                    minimumSize: Size(50.0,20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15,)
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      }else{
                        return Text('no data');
                      }
                    }
                  }
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Fit & Form',
                style: TextStyle(
                    fontFamily: "Sfui",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(43, 43, 43, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.084
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: dinnerRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (snapshots.connectionState == ConnectionState.active) {
                      if (snapshots.hasError) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshots.hasData) {
                          if (snapshots.data != null) {
                            List<DocumentSnapshot> list = snapshots
                                .data.docs;
                            return Container(
                              color: Color.fromRGBO(243, 243, 251, 1),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: list.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,

                                itemBuilder: (_, index) {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                13.9),
                                            color: Colors.white,
                                            //color: Color.fromRGBO(255, 255, 255, 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.03),
                                                  offset: Offset(0, 1),
                                                  blurRadius: 14.0
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              FutureBuilder(
                                                  future: _getImage(context,list[index]['imageName'] ),
                                                  builder: (context, snapshot){
                                                    if(snapshot.hasData){
                                                      return Image.network(snapshot.data.toString(), fit: BoxFit.cover,);
                                                    }else{
                                                      return CircularProgressIndicator();
                                                    }
                                                  }
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${list[index]['name']}',
                                                    style: TextStyle(
                                                        fontFamily: "Sfui",
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Color.fromRGBO(
                                                            43, 43, 43, 1),
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width * 0.05
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8,),
                                              Text(
                                                ' Check it out for tonight!',
                                                style: TextStyle(
                                                    fontFamily: "Sfui2",
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(
                                                        43, 43, 43, 0.7),
                                                    fontSize: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.041
                                                ),
                                              ),
                                              SizedBox(height: 8,),
                                              Row(
                                                children: [
                                                  SizedBox(width: 130,),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      String name = list[index]['imageName'];
                                                      FirebaseStorage.instance.ref().child(name).getDownloadURL().then((value) {
                                                        Navigator.pushNamed(context, '/ingredients' ,arguments: {
                                                          'color': pageThemeColor,
                                                          'recipe': list[index],
                                                          'imgUrl': value,
                                                          // 'ingredientsUrlList': ingredientsUrlList,
                                                        }).then((value) => setState((){}));
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0.0,
                                                      shape: CircleBorder(),
                                                      padding: EdgeInsets.all(
                                                          7),
                                                      primary: pageThemeColor,
                                                      // <-- Button color
                                                      onPrimary: Colors.white,
                                                      // <-- Splash color
                                                      minimumSize: Size(50.0,
                                                          20.0),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      }
                    }
                    else{
                      return Text('error');
                    }
              }
                  ),
            ),
            SizedBox(height: 150,),
          ],
        ),
      ),
    ));
  }


  }
  

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

}

Future<String?> _getImage(BuildContext context, String imageName) async {
  String? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image =  value;
  });
  if(image == null){
    return 'Error';
  }else{
    return image;
  }

}
