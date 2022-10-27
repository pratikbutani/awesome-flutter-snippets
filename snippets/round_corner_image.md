# Round Container with Image in Flutter

Code:

```
return Container(
      width: 200.0,
      height: 200.0,
      margin: const EdgeInsets.all(50.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(20.0),
        ),
        image: DecorationImage(
          image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
```

## Try out on [dartpad](https://dartpad.dev/?id=28c8fe4b5ca630a2963996f61c396878). 
