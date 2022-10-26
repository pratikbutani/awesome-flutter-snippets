# Animated Switcher Snippet

Code:
```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Switcher Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),

            child: showText
                
          ? Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ): const Text('Hacktoberfest 2022',style: TextStyle(color:Colors.red)),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                showText = !showText;
              });
            },
            label: const Text('Animate')));
  }
}
  
```

## Try out on [Dartpad](https://dartpad.dev/?id=1069aa3765c02c3bb02559dc4b1aa902). 
