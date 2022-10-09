import 'package:flutter/material.dart';
import 'package:math_puzzel/fourth.dart';
import 'package:math_puzzel/puzzel1.dart';
import 'package:math_puzzel/second.dart';


class puzzle extends StatefulWidget {
  int cur_level;
  List level_status=[];

  puzzle(this.cur_level,this.level_status);


  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
  int cur_level=0;
  List level_status=[];

  @override
  void initState() {
    //TODO:implement initState
    super.initState();
    cur_level=widget.cur_level;
    level_status=widget.level_status;
    print(level_status);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("myimage/background.jpg"),fit: BoxFit.fill)
            ),
            child: Column(
              children: [
                Container(
                  child: const Text("Select Puzzle",style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff0d47a1),
                      fontWeight: FontWeight.bold,
                      fontFamily: "f3"),),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: 28,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                            return second(index);
                          }));
                        },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: index+28<cur_level ? Colors.black : Colors.transparent),
                                borderRadius: const BorderRadius.all(Radius.circular(18)),
                                image: (level_status[index+28]=="yes")? const DecorationImage(image: AssetImage("myimage/tick.png")):
                                (level_status[index+28]=="no") ? const DecorationImage(image: AssetImage("myimage/lock.png")) : null
                            ),
                            child: (index+28<cur_level) ? Text("$index+28",style: const TextStyle(fontSize: 30,fontFamily: "f1",color: Colors.black),):null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                        return fourth(cur_level, level_status);
                      }));
                    },
                      child: Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.only(bottom: 20,left: 10),
                        //padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("myimage/back.png"))
                        ),
                      ),
                    ),
                    Expanded(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return puzzle1(widget.cur_level,widget.level_status);
                              }));
                            },
                              child: Container(
                                height: 70,
                                width: 70,
                                margin: const EdgeInsets.only(bottom: 10,right: 10),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("myimage/next.png"))
                                ),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}

