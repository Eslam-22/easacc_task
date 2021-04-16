import 'package:flutter/material.dart';

import 'loginwithfacebook.dart';
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = new GlobalKey();
    bool hidpass=true;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2)),
                    ],
                  ),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login",
                          style: (Theme.of(context).textTheme.headline2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) => input.contains("@")
                              ? "Email id shoud be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Email adress",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            prefixIcon: Icon(Icons.email,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 3
                              ? "password should be mor than 6 chracters"
                              : null,

                          obscureText: hidpass,
                          decoration: new InputDecoration(
                            hintText: "password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: Theme.of(context).accentColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidpass=!hidpass;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                              icon: Icon(hidpass
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                          onPressed:(){},
                          child:Text("Login",style:TextStyle(
                            color:Colors.white,
                          )),
                          color:Theme.of(context).accentColor,
                          shape:StadiumBorder(),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 20),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginwithFb()));
              },
              child:Text("Not user",style:TextStyle(
                color:Colors.redAccent,
                fontSize: 20,
              )),
              color:Colors.white,
              shape:StadiumBorder(),
            ),
          ],

        ),

      ),

    );
  }
}
