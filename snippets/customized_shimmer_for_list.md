
# You can create customize table with the use of following snippet.
```
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerPage extends StatelessWidget {
  final double containerHeight,
      leftMargin,
      rightMargin,
      topMargin,
      bottomMargin,
      borderRadius;
  final double? width;
  final int count;
  final bool shinkWap;
  final bool physics;

  const ListShimmerPage(
      {Key? key,
      required this.containerHeight,
      required this.bottomMargin,
      required this.leftMargin,
      required this.rightMargin,
      required this.topMargin,
      required this.count,
      required this.borderRadius,
      required this.shinkWap,
      required this.physics,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
            shrinkWrap: shinkWap,
            physics: (physics) ? const NeverScrollableScrollPhysics() : null,
            itemCount: count,
            itemBuilder: (context, index) {
              return getProjectShimmer();
            }));
  }

  Widget getProjectShimmer() {
    return Container(
      margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
          bottom: bottomMargin),
      height: containerHeight,
      width: width ?? 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Colors.grey[400],
      ),
    );
  }
}
```
`To access full code` [Dartpad](https://dartpad.dev/?id=eed39b9a98066e1b6f8e6eccbb0524c0)