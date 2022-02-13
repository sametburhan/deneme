import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import '../menu.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

class _Page1 extends State with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

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
      extendBody: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              backgroundColor(),
              menu(context),
              dashboard(context),

              /*screen(),
              downscreen(),
              upscreen(),
              topMenu(() => print("Search")),
              upstairScreentext(),
              upstairScreentext2(),
              downstairScreentext(),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF4EA3F2),
        backgroundColor: Color(0xFFE5E5E5),
        height: 60,
        buttonBackgroundColor: Color(0xFF4EA3F2),
        items: [
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.message, size: 25, color: Colors.white),
          Icon(Icons.notifications, size: 25, color: Colors.white),
          Icon(Icons.account_circle_rounded, size: 25, color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 400),
        index: 0,
        animationCurve: Curves.easeInOutExpo,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MenuDeshboardPage()));
          }
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page1()));
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

  Widget backgroundColor() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF4EA3F2),
          //Color(0xFF518ADB),
          //Color(0xFF5688F5),
          Color(0xFFE5E5E5),
        ],
        stops: [0.5, 0.9],
      )),
    );
  }

  Widget screen() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4EA3F2),
                //  Color(0xFF518ADB),
                //Color(0xFF5688F5),
                Color(0xFF4A6CE8),
              ],
              stops: [0.1, /* 0.4, 0.7,*/ 0.9],
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(50, 30),
                bottomRight: Radius.elliptical(50, 30),
                topLeft: Radius.circular(10)),
          ),
          height: 300.0,
        ),
      ],
    );
  }

  Widget upscreen() {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [scrollHorizontal()],
        ),
      ),
    );
  }

  Widget scrollHorizontal() {
    return Container(
      margin: EdgeInsets.only(bottom: 430, top: 180),
      child: Row(
        children: [
          LimitedBox(
            maxHeight: 170,
            maxWidth: 260,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          LimitedBox(
            maxHeight: 170,
            maxWidth: 260,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          LimitedBox(
            maxHeight: 170,
            maxWidth: 260,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topMenu(Function onTap) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 50, right: 20),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white, fontSize: 27, fontFamily: "Pattaya"),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ])
        ],
      ),
    );
  }

  Widget upstairScreentext() {
    return Row(children: [
      Container(
        padding: EdgeInsets.only(left: 20),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Beranda",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Pattaya",
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget upstairScreentext2() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Connect to people like you",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 20,
                        fontFamily: "Pattaya",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 25,
              ),
            ),
          ]),
    );
  }

  Widget downstairScreentext() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Explore Communities",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 20,
                      fontFamily: "Pattaya",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 25,
          ),
        ],
      ),
    );
  }

  Widget downscreen() {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            scrollVertical(),
            SizedBox(
              width: 12,
            ),
            scrollVertical()
          ],
        ),
      ),
    );
  }

  Widget scrollVertical() {
    return Container(
      //margin: EdgeInsets.only(top: 410),
      child: Column(
        children: [
          LimitedBox(
            maxHeight: 230,
            maxWidth: 170,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: 230,
            maxWidth: 170,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LimitedBox(
            maxHeight: 230,
            maxWidth: 170,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.96),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
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
                screen(),
                Container(
                  padding: EdgeInsets.only(top: 130),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      upstairScreentext(),
                      SizedBox(
                        height: 10,
                      ),
                      upstairScreentext2(),
                      SizedBox(
                        height: 20,
                      ),
                      horizontalScroll(),
                      SizedBox(
                        height: 20,
                      ),
                      downstairScreentext(),
                      SizedBox(
                        height: 20,
                      ),
                      //verticalScroll(),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            scrollVertical(),
                            SizedBox(
                              width: 12,
                            ),
                            scrollVertical()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
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
                                  "Home",
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
                                      Icons.search,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  Widget horizontalScroll() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 190,
            child: PageView(
              controller: PageController(viewportFraction: 0.85),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: LimitedBox(
                    // maxHeight: 170,
                    // maxWidth: 260,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Colors.white.withOpacity(0.96),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: LimitedBox(
                    // maxHeight: 170,
                    //maxWidth: 260,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Colors.white.withOpacity(0.96),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: LimitedBox(
                    // maxHeight: 170,
                    // maxWidth: 260,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30)),
                        color: Colors.white.withOpacity(0.96),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalScroll() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: 270,
                      width: 170,
                      child: PageView(
                        controller: PageController(viewportFraction: 1),
                        scrollDirection: Axis.vertical,
                        pageSnapping: true,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              // maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              //maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              // maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          /* SizedBox(
            width: 20,
          ),*/
          Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: 270,
                      width: 170,
                      child: PageView(
                        controller: PageController(viewportFraction: 1),
                        scrollDirection: Axis.vertical,
                        pageSnapping: true,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              // maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              //maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: LimitedBox(
                              // maxHeight: 170,
                              // maxWidth: 260,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                  color: Colors.white.withOpacity(0.96),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
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
}