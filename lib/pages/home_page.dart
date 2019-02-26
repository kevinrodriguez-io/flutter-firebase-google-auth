import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gauth_app/pages/signin_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 150,
                style: FlutterLogoStyle.horizontal,
              ),
              FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                initialData: null,
                builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                  String displayMessage = 'Welcome!';
                  if (snapshot.data != null) {
                    displayMessage = 'Welcome, ' + snapshot.data.displayName + '!';
                  }
                  return Padding(
                    padding: EdgeInsets.all(32),
                    child: Text(
                      displayMessage,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              RaisedButton.icon(
                icon: Icon(Icons.exit_to_app),
                label: Text('Sign out'),
                onPressed: _signOut,
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
