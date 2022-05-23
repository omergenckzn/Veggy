import 'package:flutter/material.dart';


class howTo extends StatefulWidget {
  const howTo({Key? key}) : super(key: key);

  @override
  _howToState createState() => _howToState();
}

class _howToState extends State<howTo> {
  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    if (route == null) return CircularProgressIndicator();
    Map howToData =  route.settings.arguments as Map;


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
                primary: howToData['color'], // <-- Button color
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
                  color: howToData['color'],
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
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text(
                'How To?',
                style: TextStyle(
                    fontFamily: "Sfui",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(43, 43, 43, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.095
                ),
              ),
             SizedBox(height: 20,),
             ListView.builder(
                 physics: NeverScrollableScrollPhysics(),
               itemCount: howToData['howToList'][0],
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Stack(
                           children: [
                             //Image.asset('assets/Tick.png'),
                             Container(
                               alignment: AlignmentDirectional.center,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(100)),
                                 color: howToData['color'],
                               ),
                               height: 30,
                               width: 30,
                             ),
                             Positioned(
                               bottom: 9,
                               left: 9,
                               child: Container(
                                   child: Image.asset('assets/Tick.png'),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(width: 15,),
                         Text(
                           'Step ${index+1}',
                           style: TextStyle(
                               fontFamily: "Sfui2",
                               fontWeight: FontWeight
                                   .w500,
                               color: Color.fromRGBO(
                                   43, 43, 43, 0.7),
                               fontSize: MediaQuery
                                   .of(context)
                                   .size
                                   .width * 0.045
                           ),
                         )
                       ],
                     ),
                     SizedBox(height: 10,),
                     Text(howToData['howToList'][index+1],
                       style: TextStyle(
                           fontFamily: "Sfui2",
                           fontWeight: FontWeight.w400,
                           color: Color.fromRGBO(43, 43, 43, 1),
                           fontSize: MediaQuery.of(context).size.width * 0.050
                       ),
                     ),
                     SizedBox(height: 15,)
                   ],
                 );
                 }
             ),
              SizedBox(height: 0,),
            ],
          ),
        ),
      ),
      ),
    );
  }
}






