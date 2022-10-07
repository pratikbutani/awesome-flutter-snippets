
# You can create customize table with the use of following snippet.
```
                    Column(
                    children: [
                    Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Table(columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(4),
                    2: FlexColumnWidth(3),
                    }, children: [
                    TableRow(children: [
                    Container(
                    height: 31,
                    margin: const EdgeInsets.only(right: 2),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(2),
                    ),
                    child: const FittedBox(child: Text("String 1"))),
                    Container(
                    height: 31,
                    margin: const EdgeInsets.only(right: 2),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(2),
                    ),
                    child: const FittedBox(child: Text("String 2"))),
                    Container(
                    height: 31,
                    margin: const EdgeInsets.only(right: 2),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(2),
                    ),
                    child: const FittedBox(child: Text("String 3"))),
                    ]),
                    ]),
                    ),
                    const SizedBox(
                    height: 2,
                    ),
                    Expanded(
                    child: ListView(children: [
                    Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Table(columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(4),
                    2: FlexColumnWidth(3),
                    }, children: getChild()),
                    )
                    ]),
                    ),
                    ),
                    ],
```

`To access full code` [Dartpad](https://dartpad.dev/?id=ecacd980e27b9264ef323a1d6c534a21)

