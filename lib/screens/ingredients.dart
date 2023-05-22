import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'dinner.dart';


class ingredients extends StatefulWidget {
  const ingredients({Key? key}) : super(key: key);

  @override
  _ingredientsState createState() => _ingredientsState();
}

class _ingredientsState extends State<ingredients> {

  @override
  Widget build(BuildContext context)  {

    var route =  ModalRoute.of(context);
    if (route == null) return CircularProgressIndicator();
    Map data =  route.settings.arguments as Map;

   Color themeColor = data['color'];
   List howToList = data['recipe']['howTo'];
   print(themeColor);
   print(data['recipe']['preperation']);
    return SafeArea(child: Scaffold(
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
              onPressed: (){
                Navigator.pop(context);
              },
              child: Container(child: Icon(
                  Icons.arrow_back_ios, color: Colors.white),
                width: 16,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: CircleBorder(),
                padding: EdgeInsets.all(4),
                primary: themeColor, // <-- Button color
                onPrimary: Colors.white, // <-- Splash color
                minimumSize: Size(50.0,20.0),
              ),
            ),
            SizedBox(width: 15,),
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
                  color: themeColor,
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
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight:  Radius.circular(40)),
                  color: themeColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Text(
                        '${data['recipe']['name']}',
                      style: TextStyle(
                          fontFamily: "Sfui",
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.090
                      ),
                    )
                  )
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Servings',
                              style: TextStyle(
                                  fontFamily: "Sfui2",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(43, 43, 43, 0.7),
                                  fontSize: MediaQuery.of(context).size.width * 0.043
                              ),
                            ),
                            SizedBox(width: 8,),
                            Icon(FlutterRemix.restaurant_fill,color: themeColor),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${data['recipe']['servings']}',
                          style: TextStyle(
                              fontFamily: "Sfui2",
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(43, 43, 43, 1),
                              fontSize: MediaQuery.of(context).size.width * 0.050
                          ),
                        ),
                      ),
                      Spacer(flex: 2,),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Preparation',
                              style: TextStyle(
                                  fontFamily: "Sfui2",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(43, 43, 43, 0.7),
                                  fontSize: MediaQuery.of(context).size.width * 0.043
                              ),
                            ),
                            SizedBox(width: 8,),
                            Icon(FlutterRemix.time_line,color: themeColor),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${data['recipe']['preperation']}',
                          style: TextStyle(
                              fontFamily: "Sfui2",
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(43, 43, 43, 1),
                              fontSize: MediaQuery.of(context).size.width * 0.050
                          ),
                        ),
                      ),
                      Spacer(flex: 2,),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Calories',
                              style: TextStyle(
                                  fontFamily: "Sfui2",
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(43, 43, 43, 0.7),
                                  fontSize: MediaQuery.of(context).size.width * 0.043
                              ),
                            ),
                            SizedBox(width: 8,),
                            Icon(FlutterRemix.fire_fill,color: themeColor),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${data['recipe']['calories']}',
                          style: TextStyle(
                              fontFamily: "Sfui2",
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(43, 43, 43, 1),
                              fontSize: MediaQuery.of(context).size.width * 0.050
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Container(child: Image.network(data['imgUrl'])),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.080),
                child: Text(
                'Ingredients',
                style: TextStyle(
                    fontFamily: "Sfui",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(43, 43, 43, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.084
                ),
            ),
              ),),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.070,vertical: MediaQuery.of(context).size.width * 0.050),
                child: ListView.builder(
                itemCount: data['recipe']['ingredients'][0],
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_,index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: themeColor,
                      ),
                      child: FutureBuilder(
                        future: _getImage(context, data['recipe']['ingredients'][index+1]),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return Image.network(snapshot.data.toString(),fit: BoxFit.scaleDown);
                          }else{
                            return CircularProgressIndicator();
                          }
                        },

                      ),//Text(data['recipe']['ingredients'][index+1]),
                    ),
                  );
                  },
            ),
              ),),
            Expanded(child: Row(
              children: [
                Spacer(flex: 3,),
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1.5,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.2,MediaQuery.of(context).size.width * 0.2),
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/howTo', arguments: {
                     'howToList' : howToList,
                      'color': themeColor,
                    }
                    );
                  },
                  child: Text('How to?',style: TextStyle(
                    color: themeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045
                  ),),
                ),
                flex: 3
                ),
                Spacer(flex:3),
              ],
            ),flex: 2,)
          ],
        ),
      ),
    ),
    );
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