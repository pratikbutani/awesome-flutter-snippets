# Counter Animation

![counter_animation](https://user-images.githubusercontent.com/28589666/195819396-8b58d2fa-02a1-4652-9c97-1af013271a21.gif)

Code:

```
late AnimationController _controller;
late Animation<double> _animation;
final Tween<double> _tween = Tween(begin: 0.75, end: 1.5);

//Add this in initState()
_controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

//Add this in initState()        
_animation = _tween
       .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)
         ..addStatusListener((AnimationStatus status) {
           if (status == AnimationStatus.completed) {
             _controller.reverse();
           }
         }));        

ScaleTransition(
    scale: _animation,
    alignment: Alignment.center,
    child: Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    ),
)
```

## Try out on [Dartpad](https://dartpad.dev/?id=255c3ca5791bff96867b7c355e09a702). 


