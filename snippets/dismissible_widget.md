# Dismissible Widget (Flutter)

Code:

```
Dismissible(
      background: Container(
          color: Colors.orangeAccent,
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.archive),
              ))),
      behavior: HitTestBehavior.opaque,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          print("startToEnd");
        } else {
          print("endToStart");
        }
      },
      crossAxisEndOffset: 0.2,
      direction: DismissDirection.horizontal,
      movementDuration: const Duration(milliseconds: 200),
      resizeDuration: const Duration(milliseconds: 1000),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.delete),
            )),
      ),
      key: const ValueKey(0),
      child: const ListTile(
        title: Text('Swipe to Dismiss'),
      ),
    );
```

## Try out on [dartpad](https://dartpad.dev/?id=668b08d65450cd0f026f72272cc2c22e). 


