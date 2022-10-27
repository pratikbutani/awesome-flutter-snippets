Example Code 

```
return Container(
      child: Transform.rotate(
        angle: 45,
        child: Text(
          'Hello, World!',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
```

Dartpad: https://dartpad.dev/?id=a98bd495eb7fab653960ec21640f2c23
