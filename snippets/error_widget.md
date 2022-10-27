```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ErrorPage(error:"Something went wrong please try again"),
    );
  }
}



class ErrorPage extends StatelessWidget {
  final IconData iconData;
  final String? error;
  

  const ErrorPage(
      {Key? key,
      this.iconData = Icons.error,
      this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 40,
              color: Colors.grey.shade400,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                error ?? "",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

),
```
DartPad:https://dartpad.dev/?id=8f6a4554e3e9a8c2aac277da1724a95a
