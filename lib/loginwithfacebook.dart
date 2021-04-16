import 'package:easacc_task/webviewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'dart:convert' as JSON;

class LoginwithFb extends StatefulWidget {
  @override
  _LoginwithFbState createState() => _LoginwithFbState();
}

class _LoginwithFbState extends State<LoginwithFb> {
  bool isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  bool isLoggedInGoogle = false;
  Map usergoogle;
  GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  String _message = 'Log in/out by pressing the buttons below.';
  _loginWithFB() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        print('I am inside this');
        isLoggedIn = true;
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<Null> _logOut() async {
    await facebookLogin.logOut();
    isLoggedIn = false;
    _showMessage('Logged out.');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start,
          children: [
        isLoggedIn
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    OutlineButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        _logOut();
                      },
                    )
                  ],
                ),
              )
            : Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 90, left:10),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    onPressed: () {
                      _loginWithFB();
                    },
                    child: Text("Facebook Login",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                        )),
                    color: Colors.white,
                    shape: StadiumBorder(),
                  ),
                ),
            ),
         isLoggedInGoogle
              ? Center(
                child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: TextButton(
                            onPressed: () {
                              _googleSignIn.signOut().then((value) {
                                setState(() {
                                  isLoggedInGoogle = false;
                                });
                              }).catchError((e) {});
                            },
                            child: Center(
                            child :  Padding(
                                padding: const EdgeInsets.only(top: 40, left: 10),
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                  onPressed: () {
                                    _googleSignIn.signIn().then((userData) {
                                      setState(() {
                                        isLoggedInGoogle = true;
                                        _userObj = userData;
                                      });
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  },
                                  child: Text("Google Login",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20,
                                      )),
                                  color: Colors.white,
                                  shape: StadiumBorder(),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
              )
              :
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 80),
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                onPressed: () {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      isLoggedInGoogle = true;
                      _userObj = userData;
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text("Google Login",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                    )),
                color: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewpage()));
              },
              child: Text("Web View",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                  )),
              color: Colors.white,
              shape: StadiumBorder(),
            ),
          ),
        ),

      ]),


    );
  }
}
