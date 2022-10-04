# Round Container with Image in Flutter

Code:

```
Container(
  width: 200.0,
  height: 200.0,
  margin: const EdgeInsets.all(50.0),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(
        Radius.circular(100.0),
    ),
    image: DecorationImage(
      image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
      fit: BoxFit.cover,
    ),
  ),
),
```

Alternative way using ClipRRect: 

```
Container(
  width: 200.0,
  height: 200.0,
  margin: const EdgeInsets.all(50.0),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(100.0),
    child: Image.network(
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
      fit: BoxFit.cover,
    ),
  )
),
```

## Try out on [dartpad](https://dartpad.dev/?id=0783da4d7149326d41c5425114ecb84d). 
