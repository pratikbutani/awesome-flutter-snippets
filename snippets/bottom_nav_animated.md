# Bottom Nav Animated

You'll be able to customize your `bottomNavigationBar` with the `CurvedNavigationBar` widget.

![ezgif-2-1d2c991527](https://user-images.githubusercontent.com/32421196/194280494-e32f5fc2-33c8-47de-a3f1-1439453acbfb.gif)

Example Code: 
```
CurvedNavigationBar(
    backgroundColor: Colors.grey.shade200,
    buttonBackgroundColor: Colors.blueAccent.shade100,
    color: Colors.white,
    items: const [
        Icon(Icons.home, color: Colors.black, size: 25),
        Icon(Icons.search, color: Colors.black, size: 25),
        Icon(Icons.create_outlined, color: Colors.black, size: 25),
        FaIcon(FontAwesomeIcons.heart, size: 25),
        Icon(Icons.person_outline, color: Colors.black, size: 25),
    ],
    index: _selectedIndex,
    onTap: _onItemTap,
)
```


## Try out on [Dartpad](https://dartpad.dev/?id=ded70a5092034eed86dd9a801c74fca9). 



