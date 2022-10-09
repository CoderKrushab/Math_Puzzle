import 'package:flutter/material.dart';
import 'package:math_puzzel/fourth.dart';
import 'package:math_puzzel/second.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  int i = 0;
  bool t1 =true;
  int cur_level=0;
  bool t2 = true;
  bool t3 = true;
  List<String> level_status = [];
  SharedPreferences ?pref;

  @override
  void initState() {
    super.initState();
    level_status=List.filled(75, "no");
    getdata();
  }
  getdata() async
  {
    pref = await SharedPreferences.getInstance();
    cur_level=pref!.getInt("levelno") ?? 0;
    for(int i = 0;i<level_status.length;i++)
    {
      level_status[i]=pref!.getString("level_status$i")??"no";
    }
    print(level_status);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("myimage/background.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(top: 40),
                        alignment: Alignment.center,
                        child: const Text(
                          "Math pazzles",
                          style: TextStyle(color:Colors.black,fontSize: 30, fontFamily: "f3"),
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 330,
                        height: 550,
                        margin: const EdgeInsets.only(top:20,left: 10,right: 10,bottom: 20),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage("myimage/blackboard_main_menu.png"),
                                fit: BoxFit.fill)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(onTapCancel: (){
                              print("onTapCancel");
                              setState((){
                                t1=true;
                              });
                            },onTapUp: (details){
                              print("onTapUp");
                              setState((){
                                t1=true;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return second(cur_level);
                              },));
                            },onTapDown: (details){
                              print("onTapDown");
                              setState((){
                                t1 =false;
                              });
                            },child:   Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:(!t1)? Colors.white:Colors.black),
                                borderRadius: BorderRadius.all(const Radius.circular(5)),
                              ),
                              margin: const EdgeInsets.only(bottom: 30),
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: const Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "f1",
                                    color: Colors.white),
                              ),
                            ),
                            ),
                            GestureDetector(onTapCancel: (){
                              print("onTapCancel");
                              setState((){
                                t2=true;
                              });
                            },onTapUp: (details){
                              print("onTapUp");
                              setState((){
                                t2=true;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return fourth(cur_level,level_status);
                              },));
                            },onTapDown: (details){
                              print("onTapDown");
                              setState((){
                                t2=false;
                              });

                            },child:   Container(
                              decoration: BoxDecoration(
                                border: Border.all(color:(!t2)? Colors.white:Colors.black),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              margin: const EdgeInsets.only(bottom:30),
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: const Text(
                                "PUZZLES",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "f1",
                                    color: Colors.white),
                              ),
                            ),
                            ),
                            GestureDetector(onTapCancel: (){
                              print("onTapCancel");
                              setState((){
                                t3=true;
                              });
                            },onTapUp: (details){
                              print("onTapUp");
                              setState((){
                                t3=true;
                              });
                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return second();
                              // },));
                            },onTapDown: (details){
                              print("onTapDown");
                              setState((){
                                t3 =false;
                              });
                            },child:   InkWell(onTap: (){
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
                                decoration: BoxDecoration(
                                  border: Border.all(color:(!t3)? Colors.white:Colors.black),
                                  borderRadius: BorderRadius.all(const Radius.circular(5)),
                                ),
                                margin: const EdgeInsets.only(bottom:30),
                                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                child: const Text(
                                  "BUY PRO",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "f1",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("myimage/ltlicon.png"))),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey
                                        ]),
                                  ),
                                  child: const Image(
                                      image: AssetImage("myimage/shareus.png")),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20, top: 10, bottom: 10),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.grey
                                        ]),
                                  ),
                                  child: const Image(
                                      image: AssetImage("myimage/emailus.png")),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20, bottom: 10, top: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: const Text(
                                    "Privacy Policy",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
