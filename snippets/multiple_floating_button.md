# Multiple Floating Button

![multiple_floating_button](https://user-images.githubusercontent.com/109585734/195868376-8f164239-5ec7-4413-a513-71614f445eb1.gif)

Code:
```
Widget _buildItem(IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        _myAnimation.status == AnimationStatus.completed
            ? _myAnimation.reverse()
            : _myAnimation.forward();
      },
      splashColor: Colors.grey,
      child: Icon(icon),
    );
}
  
body: Flow(
        delegate: MyFlowDelegate(animation: _myAnimation),
        children: _icons.map<Widget>((IconData icon) => _buildItem(icon)).toList(),
      ),
```

## Try out on [Dartpad](https://dartpad.dev/?id=e6d92a37a9a3ab88b612e517a4106074). 
