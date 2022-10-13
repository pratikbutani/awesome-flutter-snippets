   
// Use it in your code

    Container(
          alignment: Alignment.center,
          child: Column(children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 3),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: _changeOpacity,
              child: const Text('Animated Opacity'),
            ),
          ]),
        ),
    
Here is the [Dartpad](https://dartpad.dev/?id=3c9244b75040da1f33b13d47a915754b)
