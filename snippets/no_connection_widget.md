
````
typedef OnPressed = void Function();

class NoConnectionWidget extends StatelessWidget {
const NoConnectionWidget({Key? key, this.pressed}) : super(key: key);
final OnPressed? pressed;
@override
Widget build(BuildContext context) {
return SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(32.0),
child: Column(
mainAxisSize: MainAxisSize.max,
mainAxisAlignment: MainAxisAlignment.end,
children: [
SizedBox(
child: Image.asset(
'assets/images/no_internet.jpg',
//height: MediaQuery.of(context).size.height / 2,
)),
SizedBox(
width: double.infinity,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor:
MaterialStateProperty.all(AppStyles.info500Color),
),
onPressed: () {
debugPrint('NoConnectionWidget click : $pressed');
pressed?.call();
},
child: const Text('Retry'),
),
)
],
),
),
);
}
}
```
To access full code` [Dartpad](https://dartpad.dev/?id=7c1b183e77182ce7bdc3b45033f93db6)
