import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzel/model.dart';
import 'package:math_puzzel/third.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  int c_level;

  second(this.c_level);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String ans = "";
  int cur_level = 0;
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  List<String> level_status = [];
  SharedPreferences? pref;
  int cnt = 0;
  int check_cnt = 0;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    cur_level = widget.c_level;
    print("Cur_Level=$cur_level");
    getdata();
  }

  getdata() async {
    pref = await SharedPreferences.getInstance();
    cur_level = pref!.getInt("levelno") ?? 0;
    for (int i = 0; i < level_status.length; i++) {
      level_status[i] = pref!.getString("level_status$i") ?? "no";
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
                  image: AssetImage("myimage/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        cnt = pref!.getInt("counter") ?? 0;
                        print("cnt=${cnt}");
                        check_cnt = pref!.getInt("counter") ?? 0;
                        pref!.setInt("counter", cnt + 1);
                        if (check_cnt <= 2) {
                          pref!.setString("level_status$cur_level", "skip");
                          cur_level++;
                          pref!.setInt("levelno", cur_level);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return second(cur_level);
                          }));
                        } else {
                          print("check_cnt=${check_cnt}");
                          if (check_cnt == 3) {
                            DateTime now = DateTime.now();
                            pref!.setString("fixedtime", "$now");
                          } else {
                            DateTime cur = DateTime.now();
                            String fixtime =
                                pref!.getString("fixedtime") ?? "$cur";
                            int diff = cur
                                .difference(DateTime.parse(fixtime))
                                .inMinutes;
                            if (diff <= 2) {
                              showDialog(
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Skip",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: const Text(
                                      """Are you sure want to skip this level?
You can play skipped leves later by
clicking on PUZZLES menu from main
screen.""",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "CANCEL",
                                            style: TextStyle(
                                                color: Colors.pinkAccent),
                                          )),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.pinkAccent),
                                          )),
                                    ],
                                  );
                                },
                                context: context,
                              );
                            } else {
                              pref!.setInt("counter", 0);
                            }
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("myimage/skip.png"))),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("myimage/level_board.png"))),
                      alignment: Alignment.center,
                      child: Text(
                        "puzzle ${cur_level + 1}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  InkWell(
                    onTap: () {
                      showDialog(
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "hint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              "${model.hint[cur_level]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(color: Colors.pinkAccent),
                                  )),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.pinkAccent),
                                  )),
                            ],
                          );
                        },
                        context: context,
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: const Image(image: AssetImage("myimage/hint.png")),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                height: 400,
                width: 400,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 200),
                child: Image(
                  image: AssetImage("myimage/${model.img[cur_level]}"),
                  fit: BoxFit.fill,
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 400,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 200,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "$ans",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                ans = ans.substring(0, ans.length - 1);
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 40,
                              color: Colors.black,
                              child: const Image(
                                image: AssetImage("myimage/delete.png"),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("${model.ans[cur_level]}");
                              print("${int.parse(ans)}");
                              print("${cur_level}");
                              if (model.ans[cur_level] == ans) {
                                pref!.setString("level_status$cur_level", "yes");
                                cur_level++;
                                pref!.setInt("levelno", cur_level);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return third(cur_level);
                                }));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Wrong!!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 20);
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text("Submit",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  height: 40,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 10),
                                    scrollDirection: Axis.vertical,
                                    itemCount: list.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          ans = ans + list[index].toString();
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(3),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.white),
                                              color: Colors.white24,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(2))),
                                          child: Text(
                                            "${list[index]}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
