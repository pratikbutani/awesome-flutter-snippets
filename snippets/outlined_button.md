```
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkBlue,
        body: Center(
          child: MyOutlinedButton(
            onPressed: () {},
            gradient: LinearGradient(colors: [Colors.indigo, Colors.pink]),
            child: Container(height : 50, width : 120,child : Center(child : Text('OutlinedButton'))),
          ),
        ),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: gradient),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
      ),
    );
  }
}

```

https://dartpad.dev/?id=83829439faaec3f7c17b36ad712534d1
