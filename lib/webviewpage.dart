import 'package:easacc_task/webresult.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:app_settings/app_settings.dart';

class WebViewpage extends StatefulWidget {
  @override
  _WebViewpageState createState() => _WebViewpageState();
}

class _WebViewpageState extends State<WebViewpage> {
  final namecontroller = new TextEditingController();

  Widget build(BuildContext context) {
    List listitems = ['Wifi', 'Bluetooth'];
    String valuechoose;

    Future<void> initPlatformState() async {
      if (!mounted) return;
    }

    void initState() {
      initPlatformState();
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: namecontroller,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Pacifico',
              ),
              textAlign: TextAlign.center,
              cursorColor: Theme.of(context).accentColor,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Your URL',
                hintStyle: TextStyle(
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Center(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10),
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                onPressed: () {
                  var name = namecontroller.text;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebResult(
                                customer: name,
                              )));
                },
                child: Text("Search",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                    )),
                color: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          )),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButton(
                  hint: Text(
                    'Connectivity',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  iconSize: 30,
                  iconEnabledColor: Colors.redAccent,
                  iconDisabledColor: Colors.redAccent,
                  value: valuechoose,
                  style: new TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  onChanged: (newValue) {
                    setState(() {
                      valuechoose = newValue;
                    });
                  },
                  items: listitems.map((valueitem) {
                    if (valueitem == "Wifi") {
                      return DropdownMenuItem(
                          value: valueitem,
                          child: GestureDetector(
                              onTap: () {
                                AppSettings.openWIFISettings();
                              },
                              child: Text(valueitem)));
                    } else {
                      return DropdownMenuItem(
                          value: valueitem,
                          child: GestureDetector(
                              onTap: () {
                                AppSettings.openBluetoothSettings();
                              },
                              child: Text(valueitem)));
                    }
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
