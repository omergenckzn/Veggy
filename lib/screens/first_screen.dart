import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dinner.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  _firstScreenState createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  Color pageThemeColor = Color.fromRGBO(76, 175, 80, 1);
  CollectionReference recipesRef =
      FirebaseFirestore.instance.collection('recipes');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Navigator.pushNamed(context, '/menu_tab');
                },
                icon: new Image.asset('assets/threeline.png'),
                color: Colors.black),
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
                  color: Color.fromRGBO(76, 175, 80, 1),
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
                          'Welcome!',
                          style: TextStyle(
                              fontFamily: "Sfui",
                              fontWeight: FontWeight.w700,
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
                          'Are you searching for a recipe? \nTry this veggy bar below :)',
                          style: TextStyle(
                              fontFamily: "Sfui2",
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.043),
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
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Expanded(
                    child: CupertinoSearchTextField(
                      backgroundColor: Colors.white,
                      placeholder: 'type something..',
                      style: TextStyle(
                          fontFamily: "Sfui2",
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(43, 43, 43, 0.7),
                          fontSize: MediaQuery.of(context).size.width * 0.040),
                      onSubmitted: (val) {
                        Navigator.pushNamed(context, '/searchResult',
                            arguments: {
                              'searchWord': val,
                            });
                      },
                    ),
                    flex: 12,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 62,
              child: Container(
                  height: 15, width: 10, child: dinnerWidget(context)),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget dinnerWidget(context) {
  Color pageThemeColor = Color.fromRGBO(76, 175, 80, 1);
  int time = DateTime.now().hour;

  String name = 'null';

  if (06 < time && time <= 12) {
    name = 'Breakfast?';
    //Start The Day
    CollectionReference recipesRef = FirebaseFirestore.instance
        .collection('recipes'); //start the day recipes

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.054,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.096),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Check these recipes out if you don’t\nknow what you going to prepare.',
              style: TextStyle(
                  fontFamily: "Sfui2",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(43, 43, 43, 0.7),
                  fontSize: MediaQuery.of(context).size.width * 0.042),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 28,
            child: Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: recipesRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasError) {
                      return Text('no data');
                    } else {
                      if (snapshots.hasData) {
                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots.data.docs;
                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.03),
                                                offset: Offset(0, 1),
                                                blurRadius: 14.0),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            FutureBuilder(
                                                future: _getImage(context,
                                                    list[index]['imageName']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          43, 43, 43, 1),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      43, 43, 43, 0.7),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.041),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]
                                                        ['imageName'];
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(name)
                                                        .getDownloadURL()
                                                        .then((value) {
                                                      print(list[index]
                                                          ['ingredients']);
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ingredients',
                                                          arguments: {
                                                            'color':
                                                                pageThemeColor,
                                                            'recipe':
                                                                list[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: Color.fromRGBO(
                                                        76,
                                                        175,
                                                        80,
                                                        1), // <-- Button color
                                                    onPrimary: Colors
                                                        .white, // <-- Splash color
                                                    minimumSize:
                                                        Size(50.0, 20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      } else {
                        return Text('no data');
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
  if (12 < time && time <= 16) {
    CollectionReference recipesRef =
        FirebaseFirestore.instance.collection('recipes'); //fastfood recipes
    name = 'Fast Food?';
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.054,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.096),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Check these recipes out if you don’t\nknow what you going to prepare.',
              style: TextStyle(
                  fontFamily: "Sfui2",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(43, 43, 43, 0.7),
                  fontSize: MediaQuery.of(context).size.width * 0.042),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 28,
            child: Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: recipesRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasError) {
                      return Text('no data');
                    } else {
                      if (snapshots.hasData) {
                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots.data.docs;
                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.03),
                                                offset: Offset(0, 1),
                                                blurRadius: 14.0),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            FutureBuilder(
                                                future: _getImage(context,
                                                    list[index]['imageName']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          43, 43, 43, 1),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      43, 43, 43, 0.7),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.041),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]
                                                        ['imageName'];
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(name)
                                                        .getDownloadURL()
                                                        .then((value) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ingredients',
                                                          arguments: {
                                                            'color':
                                                                pageThemeColor,
                                                            'recipe':
                                                                list[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: Color.fromRGBO(
                                                        76,
                                                        175,
                                                        80,
                                                        1), // <-- Button color
                                                    onPrimary: Colors
                                                        .white, // <-- Splash color
                                                    minimumSize:
                                                        Size(50.0, 20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      } else {
                        return Text('no data');
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  if (16 < time && time <= 20) {
    CollectionReference recipesRef =
        FirebaseFirestore.instance.collection('recipes'); //dessert recipes
    name = 'Dinner?';

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.054,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.096),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Check these recipes out if you don’t\nknow what you going to prepare.',
              style: TextStyle(
                  fontFamily: "Sfui2",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(43, 43, 43, 0.7),
                  fontSize: MediaQuery.of(context).size.width * 0.042),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 28,
            child: Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: recipesRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasError) {
                      return Text('no data');
                    } else {
                      if (snapshots.hasData) {
                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots.data.docs;
                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.03),
                                                offset: Offset(0, 1),
                                                blurRadius: 14.0),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            FutureBuilder(
                                                future: _getImage(context,
                                                    list[index]['imageName']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          43, 43, 43, 1),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      43, 43, 43, 0.7),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.041),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]
                                                        ['imageName'];
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(name)
                                                        .getDownloadURL()
                                                        .then((value) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ingredients',
                                                          arguments: {
                                                            'color':
                                                                pageThemeColor,
                                                            'recipe':
                                                                list[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: Color.fromRGBO(
                                                        76,
                                                        175,
                                                        80,
                                                        1), // <-- Button color
                                                    onPrimary: Colors
                                                        .white, // <-- Splash color
                                                    minimumSize:
                                                        Size(50.0, 20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      } else {
                        return Text('no data');
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  if (20 < time && time <= 24) {
    CollectionReference recipesRef =
        FirebaseFirestore.instance.collection('recipes'); //dessert recipes
    name = 'Dessert?';

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.054,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.096),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Check these recipes out if you don’t\nknow what you going to prepare.',
              style: TextStyle(
                  fontFamily: "Sfui2",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(43, 43, 43, 0.7),
                  fontSize: MediaQuery.of(context).size.width * 0.042),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 28,
            child: Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: recipesRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasError) {
                      return Text('no data');
                    } else {
                      if (snapshots.hasData) {
                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots.data.docs;
                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.03),
                                                offset: Offset(0, 1),
                                                blurRadius: 14.0),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            FutureBuilder(
                                                future: _getImage(context,
                                                    list[index]['imageName']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          43, 43, 43, 1),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      43, 43, 43, 0.7),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.041),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]
                                                        ['imageName'];
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(name)
                                                        .getDownloadURL()
                                                        .then((value) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ingredients',
                                                          arguments: {
                                                            'color':
                                                                pageThemeColor,
                                                            'recipe':
                                                                list[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: Color.fromRGBO(
                                                        76,
                                                        175,
                                                        80,
                                                        1), // <-- Button color
                                                    onPrimary: Colors
                                                        .white, // <-- Splash color
                                                    minimumSize:
                                                        Size(50.0, 20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      } else {
                        return Text('no data');
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  } else {
    CollectionReference recipesRef =
        FirebaseFirestore.instance.collection('recipes');
    name = 'Fast Food';

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.054,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Sfui",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontSize: MediaQuery.of(context).size.width * 0.096),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Check these recipes out if you don’t\nknow what you going to prepare.',
              style: TextStyle(
                  fontFamily: "Sfui2",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(43, 43, 43, 0.7),
                  fontSize: MediaQuery.of(context).size.width * 0.042),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 28,
            child: Container(
              color: Colors.white,
              height: 261,
              child: StreamBuilder<QuerySnapshot>(
                  stream: recipesRef.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasError) {
                      return Text('no data');
                    } else {
                      if (snapshots.hasData) {
                        if (snapshots.data != null) {
                          List<DocumentSnapshot> list = snapshots.data.docs;
                          return Container(
                            color: Color.fromRGBO(243, 243, 251, 1),
                            child: ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.9),
                                          color: Colors.white,
                                          //color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.03),
                                                offset: Offset(0, 1),
                                                blurRadius: 14.0),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            FutureBuilder(
                                                future: _getImage(context,
                                                    list[index]['imageName']),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      fit: BoxFit.cover,
                                                    );
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                            Row(
                                              children: [
                                                Text(
                                                  '${list[index]['name']}',
                                                  style: TextStyle(
                                                      fontFamily: "Sfui",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          43, 43, 43, 1),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              ' Check it out for tonight!',
                                              style: TextStyle(
                                                  fontFamily: "Sfui2",
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      43, 43, 43, 0.7),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.041),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    String name = list[index]
                                                        ['imageName'];
                                                    FirebaseStorage.instance
                                                        .ref()
                                                        .child(name)
                                                        .getDownloadURL()
                                                        .then((value) {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ingredients',
                                                          arguments: {
                                                            'color':
                                                                pageThemeColor,
                                                            'recipe':
                                                                list[index],
                                                            'imgUrl': value,
                                                            // 'ingredientsUrlList': ingredientsUrlList,
                                                          });
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.white),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shape: CircleBorder(),
                                                    padding: EdgeInsets.all(7),
                                                    primary: Color.fromRGBO(
                                                        76,
                                                        175,
                                                        80,
                                                        1), // <-- Button color
                                                    onPrimary: Colors
                                                        .white, // <-- Splash color
                                                    minimumSize:
                                                        Size(50.0, 20.0),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          return Text('No Data');
                        }
                      } else {
                        return Text('no data');
                      }
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String?> _getImage(BuildContext context, String imageName) async {
  String? image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = value;
  });
  if (image == null) {
    return 'Error';
  } else {
    return image;
  }
}
