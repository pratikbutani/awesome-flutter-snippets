#progress_hud_widget

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
        body: Center(
          child: progressHudWidget(context),
        ),
      ),
    );
  }

  
  static Widget progressHudWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.amber),
    );
  }
}```

Dart Pad : https://dartpad.dev/?id=fec16cb118ee2648f974b85905f0d5e1
