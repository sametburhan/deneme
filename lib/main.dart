import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'signUp.dart';
import 'pages/page1.dart';
import 'models/users.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  Main createState() {
    return new Main();
  }
}

class Main extends State<MyApp> {
  var user1 = Users.withoutInfo();
  bool rememberMe = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              backgroundColor(),
              screen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backgroundColor() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4EA3F2),
          Color(0xFF518ADB),
          Color(0xFF5688F5),
          Color(0xFF4A6CE8),
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      )),
    );
  }

  Widget screen() {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Pattaya",
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            emailBox(),
            SizedBox(
              height: 30.0,
            ),
            passwordBox(),
            //forgotPassword(),
            checkBox(),
            SizedBox(
              height: 20,
            ),
            loginButton(),
            socialSignIn(),
            SizedBox(
              height: 20,
            ),
            signUpButton(),
          ],
        ),
      ),
    );
  }

  Widget signUpButton() {
    return GestureDetector(
      onTap: () {
        /* setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUp()));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Create an Account')));
        });*/
      }, //=> print("Sign Up Button Pressed"),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "If you dont have any account?  ",
              style: TextStyle(
                color: Colors.indigo[50],
                fontSize: 16,
                fontFamily: "Pattaya",
                height: 2,
              ),
            ),
            TextSpan(
              text: "Sign Up Here",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Pattaya",
                height: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialSignIn() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          facebook(() => print("Login with Facebook"),
              AssetImage("assets/logos/facebook.png")),
          signInWith(),
          google(() => print("Login with Google"),
              AssetImage("assets/logos/google.png")),
        ],
      ),
    );
  }

  Widget google(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Colors.indigo[50],
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              //offset: Offset(0, 2),
              //blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget facebook(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo[50],
            width: 1.0,
          ),
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              //offset: Offset(0, 2),
              //blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget signInWith() {
    return Column(
      children: <Widget>[
        Text(
          "~OR~",
          style: TextStyle(
            fontFamily: "Pattaya",
            color: Colors.indigo[50],
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Sign In With",
          style: TextStyle(
            fontFamily: "Pattaya",
            color: Colors.indigo[50],
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget passwordBox() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Password",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Pattaya",
              fontSize: 17,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF4A6CE8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13)),
              border: Border.all(
                color: Colors.blue[900],
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -2,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: TextFormField(
              validator: (String value) {
                user1.password = value;
                if (value == null || value.isEmpty) {
                  return "       Please enter password";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(color: Colors.indigo[50], fontFamily: "Pattaya"),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Enter Your Password",
                hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white60,
                    fontFamily: "Pattaya"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  Widget emailBox() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "E-mail",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Pattaya",
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4A6CE8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13)),
                border: Border.all(
                  color: Colors.blue[900],
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: -2,
                    blurRadius: 5,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextFormField(
                validator: (String value2) {
                  user1.email = value2;
                  if (value2 == null || value2.isEmpty) {
                    return "       Please enter mail address";
                  }
                  return null; //setstate içine koy anlık içerik güncellensin
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontFamily: "Pattaya"),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: "Enter Your Mail Address",
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white60,
                      fontFamily: "Pattaya"),
                ),
              ),
            ),
          ],
        ));
  }

  Widget checkBox() {
    bool check = false;
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      //height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.indigo[50],
            ),
            child: Checkbox(
              value: rememberMe,
              checkColor: Color(0xFF4A6CE8),
              activeColor: Colors.indigo[50],
              onChanged: (bool check) {
                setState(() {
                  rememberMe = check;
                });
              },
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 0.0),
              textStyle: TextStyle(fontFamily: "Pattaya", fontSize: 15.0),
              primary: Colors.indigo[50],
            ),
            onPressed: () {
              print("Remember me pressed");
              check = true;
            },
            child: Column(
              children: [
                Text('Remember Me'),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              //padding: EdgeInsets.only(left: 10),
              textStyle: TextStyle(fontFamily: "Pattaya", fontSize: 0.0),
              primary: Colors.indigo[50],
            ),
            onPressed: () {
              print("Forgot Password Button Pressed");
            },
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                //Padding(padding: EdgeInsets.only(left: 50)),
                Column(
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Pattaya",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    void alert(BuildContext context, String email, String password) {
      if (email != null && password != null) {
        var _text = Users(email, password).getstatus;
        var alert = AlertDialog(
          content: Text(_text),
        );
        if (_text == "Login successful") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login in')));
        }
        //showDialog(context: context, builder: (BuildContext content) => alert);
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      width: double.infinity,
      height: 90,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState.validate() &&
              _formKey2.currentState.validate()) {}
          alert(context, user1.email, user1.password);
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Color(0xFF4A6CE8),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            side: BorderSide(color: Colors.blue[900], width: 1.5),
            shadowColor: Colors.black87,
            elevation: 5.0,
            padding: EdgeInsets.all(15.0)),
        child: Text(
          "Login",
          style: TextStyle(
            color: Color(0xFF4A6CE8),
            fontFamily: "Pattaya",
            fontSize: 17.0,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
