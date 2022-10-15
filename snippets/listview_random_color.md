// Add random color function in listview

     Color randomColor(){
       return (Colors.primaries[Random().nextInt(Colors.primaries.length)]);
     }

// Add listview function in code

      Widget colorListView(int count) {
        return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          Color selectColor = randomColor();
          Color backgroundColor = randomColor();
          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color:backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              children: [
                ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Icon(Icons.heart_broken_outlined,
                      color: selectColor),
                    trailing: Text("Random Number : ${Random().nextInt(100)}",
                      style: TextStyle(color: selectColor, fontSize: 15),
                    ),
                    title: Text("List item $index",style: TextStyle(color: selectColor, fontSize: 15))),
              ],
            ),
          );
        });
  	}

   
// Use it in your code

    Container(
          alignment: Alignment.center,
          child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {});
                    },
                    child: const Text(' Update Color ListView'),
                  ),
                ),
                Expanded(child: colorListView(5)),
              ],
            ),
        ),
    
Here is the [Dartpad](https://dartpad.dev/?id=09c098da6e460390a5ac677fa38f39d7)
