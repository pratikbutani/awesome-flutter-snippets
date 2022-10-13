// Add global variable 

  int _value = 0;

// Add Function 

    Widget _addRadioButton(int totalRadioButton){
    
    List<Widget> list = [];
   
    for(int i=0;i<totalRadioButton;i++){
      ListTile listTile = ListTile(
        title: Text(
          'Radio ${i+1}',
          style: TextStyle(color: Colors.black),
        ),
        leading: Radio(
          value: i,
          groupValue: _value,
          activeColor: Color(0xFF6200EE),
          onChanged: (int? value) {
            setState(() {
              _value = value!;
            });
          },
        ),
      ); 
      list.add(listTile);
    }
    return Column(children : list);
  }
   

// Use it in your code

   Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                _addRadioButton(3),
                 Text('Selected Value : Radio ${_value+1}',
                  style: TextStyle(color: Colors.black),
                ),
            ]
     ) 
   ),

    
Here is the [Dartpad](https://dartpad.dev/?id=635669092c47677af1260f8e2b5712e4)
