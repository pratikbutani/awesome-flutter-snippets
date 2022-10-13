# Menu Bar Animated

You'll be able to customize your `menu_bar_animated` with the `AnimatedBuilder` widget.

![ezgif com-gif-maker](https://user-images.githubusercontent.com/90324652/194710937-60d5c90a-8a00-4ede-a951-7fea3250d5f3.gif)

Example Code: 
```
AnimatedBuilder(
    animation: _staggeredController,
    builder: (context, child) {
        final animationPercent = Curves.easeOut.transform(
            _itemSlideIntervals[i].transform(_staggeredController.value),
        );
        final opacity = animationPercent;
        final slideDistance = (1.0 - animationPercent) * 150;
            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
        child: Text(
            _menuTitles[i],
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
            ),
        ),
    ),
)
```

## Try out on [Dartpad](https://dartpad.dev/?id=a5e47a3b8b33c7f59280ab95a4d5d876). 



