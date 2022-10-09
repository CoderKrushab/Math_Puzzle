import 'package:flutter/material.dart';
import 'package:math_puzzel/first.dart';
import 'package:math_puzzel/second.dart';

class third extends StatefulWidget {
  int cur_level;
  third(this.cur_level);


  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("myimage/background.jpg"),
                  fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child:Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 10,bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "Pazzles ${widget.cur_level} Completed",
                          style: const TextStyle(color: Color(0xff0d47A1),fontSize: 30,fontStyle: FontStyle.italic),
                        ),
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 220,
                    height: 260,
                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                            AssetImage("myimage/trophy.png"),
                            fit: BoxFit.fill)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return second(widget.cur_level);
                        }));
                      },
                        child: Container(
                          height: 45,
                          width: 180,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.blueGrey,
                                  Colors.white,
                                  Colors.blueGrey
                                ]),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "f3",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return first();
                        }));
                      },
                        child: Container(
                          height: 45,
                          width: 180,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.blueGrey,
                                  Colors.white,
                                  Colors.blueGrey
                                ]),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "MAIN MENU",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "f3",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: (){
                        showDialog(
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Benefits of pro version",style: TextStyle(color: Color(0xff0d47a1),fontWeight: FontWeight.bold,fontSize: 20),),
                              content: const Text("""1.No ads
2.No wait time for hint and skip
3.Hint for every level
4.Solution for every level""",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                              actions: [
                                InkWell(onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Container(
                                    height: 45,
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueGrey),
                                      borderRadius:const BorderRadius.all(Radius.circular(18)),
                                      gradient: const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Colors.blueGrey,
                                            Colors.white,
                                            Colors.blueGrey
                                          ]
                                      ),
                                    ),
                                    child: const Text("BUY",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Container(
                                    height: 45,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 30),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueGrey),
                                      borderRadius:const BorderRadius.all(Radius.circular(18)),
                                      gradient: const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Colors.blueGrey,
                                            Colors.white,
                                            Colors.blueGrey
                                          ]),
                                    ),
                                    child: const Text("No,Thanks",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          context: context,
                        );
                      },
                        child: Container(
                          height: 45,
                          width: 180,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.blueGrey,
                                  Colors.white,
                                  Colors.blueGrey
                                ]),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "BUY PRO",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "f3",
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text
                          ("SHARE THIS PUZZLE",
                          style: TextStyle(
                              color: Color(0xff0d47a1),
                              fontSize: 20)
                          ,)
                        ,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(18)),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.blueGrey,
                                Colors.white,
                                Colors.blueGrey
                              ]),
                        ),
                        child: const Image(
                            image: AssetImage("myimage/shareus.png")),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
