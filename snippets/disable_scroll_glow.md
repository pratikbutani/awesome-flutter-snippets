

# Disable Scroll GLow

You'll be able to stop the blue scroll glow when reach to top or bottom.

Just wrap your widget with ScrollConfigration widget and in the behaviour, give this widget's reference

'''
class DisableScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

'''

##Example code

'''
                ScrollConfiguration(
                    behavior: DisableScrollGlow(),
                    child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (ctx, index) {
                            return Text("Demo list view");
                  ),
'''