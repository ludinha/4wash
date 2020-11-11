import 'package:flutter/material.dart';
import 'package:app4wash/home-page.dart';
import 'package:app4wash/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginTextController = TextEditingController();
  final passwTextController = TextEditingController();
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   loginTextController.dispose();
  //   passwTextController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'Hero',
      child: Image.asset('lib/assets/iconhome.png'),
    );

    final login = TextFormField(
      controller: loginTextController,
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final password = TextFormField(
      controller: passwTextController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final buttonSign = MaterialButton(
      elevation: 0,
      minWidth: double.maxFinite,
      height: 50,
      onPressed: () async {
        final GoogleSignInAccount googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final FirebaseUser user =
            (await firebaseAuth.signInWithCredential(credential)).user;
      },
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10),
          Text('Sign-in using Google',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
      textColor: Colors.white,
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: RaisedButton(
            onPressed: () async {
              try {
                firebaseAuth.signInWithEmailAndPassword(
                    email: loginTextController.text,
                    password: passwTextController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              } on FirebaseAuthException catch (e) {
                if (e.code == 'wrong-password') {
                  print('Senha incorreta.' + e.message);
                } else {
                  print(e.message);
                }
              }
            },
            padding: EdgeInsets.all(12.0),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12.0)),
            color: Colors.blueAccent,
            child: Text('Login', style: TextStyle(color: Colors.white)))
            );

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            login,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            buttonSign
          ],
        ),
      ),
    );
  }
}
