import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key? key}) : super(key: key);

  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  var firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: Text('Write Data'),
                onPressed: (){
                  String name = 'Spinach Soup';
                  List<String> splitList = name.split(" ");
                  print(splitList);
                  List<String> indexList = [];

                  for(int i = 0; i< splitList.length; i++){
                    for(int y = 1; y < splitList[i].length +1; y++){
                     indexList.add(splitList[i].substring(0,y).toLowerCase());
                    }
                  }
                  print(indexList);

                  firestoreInstance.collection("recipes").add(
                      {
                        "calories" : 100,
                        "howTo" : [
                          4,
                          "Heat the butter in a large saucepan. Add the spring onions, leek, celery and potato. Stir and put on the lid. Sweat for 10 minutes, stirring a couple of times.",
                          "Pour in the stock and cook for 10 – 15 minutes until the potato is soft.",
                          "Add the spinach and cook for a couple of minutes until wilted. Use a hand blender to blitz to a smooth soup.",
                          "Stir in the crème fraîche. Reheat and serve.",

                        ],
                        "imageName" : "spinachOnPlate.png",
                        "ingredients" : [
                          2,
                          "brocc.png",
                          "oil.png",

                        ],
                        "name" : "Spinach Soup",
                        "preperation" : "20min",
                        "servings" : 4,
                        "searchIndex": indexList

                      }).then((value){
                    print('finished');
                  });
                },
              ),
            ),

            TextField(
            textInputAction: TextInputAction.search,
      decoration: InputDecoration(
      hintText:'type something..',
      hintStyle: TextStyle(
      fontFamily: "Sfui2",
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(43, 43, 43, 0.4),
      fontSize: MediaQuery.of(context).size.width * 0.043,

      ),
      ),
              onSubmitted:  (val) {
              print(val);

              },

            ),

          ],
        )
      ),
    );

  }
}
class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}


