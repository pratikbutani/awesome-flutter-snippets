// Add Function in code


   void showAlertDialog(BuildContext context) {
 
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

   
    AlertDialog alert = AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("This is my flutter Alert Dialog ?"),
      actions: [
        noButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
   
// Use it in your code

    Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: ElevatedButton(
                  onPressed: (){
                    showAlertDialog(context);
                  },
                  child: const Text('Alert Dialog'),
                ),
          ),
        ),
    
Here is the [Dartpad](https://dartpad.dev/?id=2c9fbba0e2ee3223d64d517150044aca)
