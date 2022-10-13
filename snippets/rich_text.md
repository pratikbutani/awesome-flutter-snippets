   
// Use it in your code

    Container(
            alignment: Alignment.center,
            child: const Text.rich(
              TextSpan(

                children: <TextSpan>[
                  TextSpan(
                      text: "Normal   ",
                      style: TextStyle(fontStyle: FontStyle.normal)),
                  TextSpan(
                      text: "Italic   ",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: "Bold   ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Underline  ",
                    style: TextStyle(decoration: TextDecoration.underline)),
                  TextSpan(
                    text: "Text Color   ",
                    style: TextStyle(color: Colors.green)),
                  TextSpan(
                    text: "Font Size   ",
                    style: TextStyle(fontSize: 20)),
                ],
              ),
            )),
    
Here is the [Dartpad](https://dartpad.dev/?id=c93ef591d980de280c1aed1af12dafa5)
