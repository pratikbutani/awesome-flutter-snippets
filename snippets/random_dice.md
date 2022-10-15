// Add global variable name

    int randomNumber = 1;
    double opacityLevel = 1.0; 

// Add Color change function

     Color randomColor() {
        return (Colors.primaries[Random().nextInt(Colors.primaries.length)]);
     }

// Add Random dice number function
  
	  Widget showDice() {
    		return AnimatedOpacity(
      		opacity: opacityLevel,
      		duration: const Duration(seconds: 3),
      		child: Container(
        		height: 200,
        		width: 200,
        		decoration: BoxDecoration(
            		color: randomColor(),
            		borderRadius: const BorderRadius.all(Radius.circular(15))),
        			alignment: Alignment.center,
        		child: Text("${randomNumber + 1}",
          				style: const TextStyle(fontSize: 50, color: Colors.white),
        		),
      	),
    		);
    	}

// Use it in your code

    Container(
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                      _changeOpacity();
                  },
                  child: const Text('Update Dice'),
                ),
              ),
              const SizedBox(height: 50),
              showDice(),
            ],
          ),
        ),
      ),
    
Here is the [Dartpad](https://dartpad.dev/?id=d347c2d6b5de3731f36ba688faabffb8)
