ElevatedButton(
  style: ElevatedButton.styleFrom(
    shadowColor: Colors.black, //specify the button's elevation color
    elevation: 4.0, //buttons Material shadow
    textStyle: TextStyle(fontFamily: 'roboto'), //specify the button's text TextStyle
    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0), //specify the button's Padding
    minimumSize: Size(20, 40), //specify the button's first: width and second: height
    side: BorderSide(color: Colors.yellow, width: 2.0, style: BorderStyle.solid), //set border for the button
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)), // set the buttons shape. Make its birders rounded etc
    enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
    disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
    visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0), //set the button's visual density
    tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
    animationDuration: Duration(milliseconds: 100), //the buttons animations duration
    enableFeedback: true, //to set the feedback to true or false
    alignment: Alignment.bottomCenter, //set the button's child Alignment
  ),
    onPressed: () => {} , //set both onPressed and onLongPressed to null to see the disabled properties
    onLongPress: () => {}, //set both onPressed and onLongPressed to null to see the disabled properties
    child: Text('ElevatedButton')
),

DartPad:https://dartpad.dev/?id=e75b493dae1287757c5e1d77a0dc73f1
