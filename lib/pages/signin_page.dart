import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gauth_app/pages/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  _signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final firebaseUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in as: ' + firebaseUser.displayName);
      await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 150,
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Firebase Auth + Google Auth',
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton.icon(
                icon: Icon(FontAwesomeIcons.google),
                label: Text('Sign in with Google'),
                onPressed: _signInWithGoogle,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
