import 'package:flutter/material.dart';

import 'package:math_puzzel/puzzel.dart';
import 'package:math_puzzel/second.dart';


class fourth extends StatefulWidget {
  int cur_level;
  List level_status=[];
  fourth(this.cur_level,this.level_status);

  @override
  State<fourth> createState() => _fourthState();
}

class _fourthState extends State<fourth> {
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
    return Scaffold(
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
                                border: Border.all(color: index<cur_level ? Colors.black : Colors.transparent),
                                borderRadius: const BorderRadius.all(Radius.circular(18)),
                                image: (level_status[index]=="yes")? const DecorationImage(image: AssetImage("myimage/tick.png")):
                                (level_status[index]=="no") ? const DecorationImage(image: AssetImage("myimage/lock.png")) : null
                            ),
                            child: (index<cur_level) ? Text("${index+1}",style: const TextStyle(fontSize: 30,fontFamily: "f1",color: Colors.black),):null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return puzzle(cur_level,level_status);
                        }));
                      },
                        child: Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.only(bottom: 20,right: 20),
                          child: const Image(image: AssetImage("myimage/next.png")),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
