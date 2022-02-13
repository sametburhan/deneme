import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/users.dart';
import 'models/validation.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  List users;
  SignUp(List users) {
    this.users = users;
  }

  @override
  State<StatefulWidget> createState() {
    return _SignUpState(users);
  }
}

class Basarili {
  Basarili.withoutInfo();
}

class _SignUpState extends State with Validation {
  List users;
  _SignUpState(List users) {
    this.users = users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back"),
      ),
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

  Widget inputPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "***********",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.blue[900],
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          fontSize: 18,
          color: Colors.white24,
          fontFamily: "Pattaya",
        ),
        labelStyle:
            TextStyle(fontFamily: "Pattaya", color: Colors.white, fontSize: 17),
      ),
      validator: valPassword,
      onSaved: (String value) {},
    );
  }

  Widget inputMail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Mail Address",
        hintText: "samet@mail.com",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900], width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintStyle: TextStyle(
            fontFamily: "Pattaya", fontSize: 18.0, color: Colors.white24),
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontFamily: "Pattaya",
        ),
      ),
      validator: valEmail,
      onSaved: (String value) {
        //value = Users.withoutInfo();
      },
    );
  }

  Widget screen() {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 70.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pattaya",
                  fontSize: 30.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              inputMail(),
              SizedBox(
                height: 30,
              ),
              inputPassword(),
              SizedBox(
                height: 30.0,
              ),
              signUpButton(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  Widget signUpButton() {
    /*void alert(BuildContext context, String email, String password) {
      if (email != null && password != null) {
        var alert = AlertDialog(
          content: Text(Users(email, password).getstatus),
        );
        showDialog(context: context, builder: (BuildContext content) => alert);
      }
    }*/

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      width: double.infinity,
      height: 90,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            users.add(users);
            Navigator.pop(context);
          }
          Future.delayed(Duration(seconds: 1));
          //alert(context, user1.email, user1.password);
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
          "SignUp",
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
