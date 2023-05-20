import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuTab extends StatelessWidget {
  const menuTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Navigator.pop(context);
                  },
                  icon: new Image.asset('assets/threeline.png'), color: Colors.black),
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
                    color: Color.fromRGBO(76, 175, 80, 1),
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
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.18, MediaQuery.of(context).size.width * 0.1, MediaQuery.of(context).size.width * 0.18, MediaQuery.of(context).size.width * 0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/firstScreen');
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/homeicon.png'),
                      SizedBox(width: 12,),
                      Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/startTheDay');
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/sun.png'),
                      SizedBox(width: 9,),
                      Text(
                        'Start the day',
                        style: TextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/dinner');
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/dinner.png'),
                      SizedBox(width: 10,),
                      Text(
                        'Dinner',
                        style: TextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/fastfood');
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/fastfood.png'),
                      SizedBox(width: 12,),
                      Text(
                        'Fast Food',
                        style: TextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/dessert');
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/dessert.png'),
                      SizedBox(width: 12,),
                      Text(
                        'Dessert',
                        style: TextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.045
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
