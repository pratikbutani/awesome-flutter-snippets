



# Progress loader overlay

You'll be able to customize your `loader` with the `ProgressDialogUtils` widget.

##Dependencies
1. get
2. flutter_spinkit

Example Code: 
```
class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: SpinKitCircle(
          color: primaryColor,
          size: 20),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}
```


## Try out on [Dartpad](https://dartpad.dev/?id=802b01dbfd3552d4072c28302c616889). 



