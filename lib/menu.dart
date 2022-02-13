import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/pages/page1.dart';
import 'main.dart';

final Color backgroundColor = Color(0xFFE5E5E5);

class MenuDeshboardPage extends StatefulWidget {
  @override
  _MenuDeshboardPageState createState() => _MenuDeshboardPageState();
}

class _MenuDeshboardPageState extends State
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  double _height = 350.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            backgroundColoring(),
            menu(context),
            dashboard(context),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber,
        backgroundColor: Color(0xFFE5E5E5),
        height: 60,
        buttonBackgroundColor: Colors.deepOrange,
        items: [
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.message, size: 25, color: Colors.white),
          Icon(Icons.notifications, size: 25, color: Colors.white),
          Icon(Icons.account_circle_rounded, size: 25, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 400),
        index: 3,
        animationCurve: Curves.easeInOutExpo,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page1()));
          }
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MenuDeshboardPage()));
          }
          /* if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MenuDeshboardPage()));
          }
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MenuDeshboardPage()));
          }*/
          debugPrint("Current index $index");
        },
      ),
    );
  }

  Widget backgroundColoring() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.amber,
          //Color(0xFF518ADB),
          //Color(0xFF5688F5),
          Color(0xFFE5E5E5),
        ],
        stops: [0.5, 0.9],
      )),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 500),
                  child: Row(
                    children: [
                      InkWell(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Pattaya",
                              color: Colors.black),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          });
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pattaya"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pattaya"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pattaya"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Pattaya"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        top: isCollapsed ? 0 : 0.2 * screenHeight,
        bottom: isCollapsed ? 0 : 0.2 * screenWidth,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        duration: duration,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              elevation: 8,
              color: Color(0xFFE5E5E5),
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Stack(children: [
                    contentMenu(),
                    /*Container(
                      //padding: EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                        children: [
                        ],
                      ),
                    ),*/
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (isCollapsed) {
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                    }
                                    isCollapsed = !isCollapsed;
                                  });
                                }),
                            Text(
                              "Account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontFamily: "Pattaya"),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ])),
            )));
  }

  Widget contentMenu() {
    return Container(
      child: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            screen(),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.amber,
                            Colors.deepOrange,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 60,
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 35.0, vertical: 13),
                  child: Icon(
                    Icons.history,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.amber,
                            Colors.deepOrange,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 60,
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 35.0, vertical: 13),
                  child: Icon(
                    Icons.save,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.amber,
                            Colors.deepOrange,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 60,
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 35.0, vertical: 13),
                  child: Icon(
                    Icons.ad_units_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.amber,
                            Colors.deepOrange,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 60,
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 35.0, vertical: 13),
                  child: Icon(
                    Icons.add_comment_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.amber,
                            Colors.deepOrange,
                          ],
                          stops: [
                            0.1,
                            0.9
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 60,
                ),
                Container(
                  margin:
                      new EdgeInsets.symmetric(horizontal: 35.0, vertical: 13),
                  child: Icon(
                    Icons.add_reaction_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  List<bool> _isOpen;

  Widget screen() {
    return Stack(
      children: [
        Container(
          //AnimatedSize(
          // duration: null,
          // vsync: null,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.amber,
                  //Color(0xFF518ADB),
                  //Color(0xFF5688F5),
                  Colors.deepOrange,
                ],
                stops: [0.1, 0.9],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(50, 30),
                bottomRight: Radius.elliptical(50, 30),
                topLeft: Radius.circular(10),
              ),
            ),
            height: _height,
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 120),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.amber,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/logos/batman.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildText(context),
          ],
        ),
      ],
    );
  }

  Widget buildText(BuildContext context) => Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.all(20).copyWith(top: 10),
          tilePadding: EdgeInsets.symmetric(horizontal: 90),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "More information",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Pattaya",
                      color: Colors.black54),
                ),
              ),
            ],
          ),
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Pattaya",
                color: Colors.black54,
              ),
            )
          ],
          onExpansionChanged: (_isOpen) => setState(() {
            if (_isOpen == true) {
              Future.delayed(const Duration(milliseconds: 50), () {
                setState(() {
                  _height = 700;
                });
              });
            } else if (_isOpen == false) {
              Future.delayed(const Duration(milliseconds: 170), () {
                setState(() {
                  _height = 330.0;
                });
              });
            }
          }),
        ),
      );
}
