## TextFormField obscureText in AlertDialog don't change

```
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final username = TextEditingController(text: '');
  final password = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  late bool obscure;

  @override
  void initState() {
    obscure = true;
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return StatefulBuilder(
              builder: (context, setState)
          {
            return AlertDialog(
              title: const Text('Connection'),
              content: SizedBox(
                  height: 400,
                  width: 400,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Colors.grey,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          controller: username,
                          validator: (value) {
                            return null;
                          },
                          decoration: const InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(
                              Icons.person_outlined,
                            ),
                            labelText: 'username',
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          cursorColor: Colors.grey,
                          controller: password,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: const Icon(Icons.key),
                            labelText: 'password',
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  // CHAGE OBSCURE
                                  setState(() {
                                    obscure = !obscure;
                                    if (kDebugMode) {
                                      print(obscure); // OK
                                    }
                                  });
                                }),
                          ),
                          obscureText: obscure,
                          // NOT OK
                          obscuringCharacter: '*',
                          validator: (String? value) {
                            return null;
                          },
                        ),
                      ],
                    ),
                  )),
              actions: [
                TextButton(
                  child: const Text('Send'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });

            },
            icon: const Icon(Icons.person_outline_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
```

Checkout the demo on (dartpad.dev)[https://dartpad.dev/?id=4575689ba129c6f0f036ce5cf04cdb31]
