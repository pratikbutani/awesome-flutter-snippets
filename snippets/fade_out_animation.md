Example code

```
@override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.all(0),
      width: 200,
      duration: Duration(seconds: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: _opacity,
            curve: Curves.bounceInOut,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                child:
                    Text('Animate Me', style: TextStyle(color: Colors.black)),
                onPressed: () => setState(() => _opacity = 0)),
          )
        ],
      ),
    );
  }
```
DartPad:https://dartpad.dev/?id=3aca3166bd41e86b0a659618ed4c346a
