

# Success and error snackbar using getx

You'll be able to customize your `snackbar` with the enum.

## Dependencies
1. get


### Use this function wherever you want snackbar to be appear
'''
enum SNACK { SUCCESS, FAILED }
getSnackBar(String message, SNACK type, {String? title}) {
  return Get.snackbar(title ?? '', '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == SNACK.SUCCESS ? Colors.green : Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      colorText: Colors.white,
      titleText: Container(
        height: 0,
      ),
      messageText: Text(
        message,
        style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      margin: const EdgeInsets.all(0));
}
'''