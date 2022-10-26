# You can pick images from device's gallery and also cropped it with the use of below snippet.


````
Add below lines to AndroidManifest to avoid crash.
<activity
android:name="com.yalantis.ucrop.UCropActivity"
android:screenOrientation="portrait"
android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

```
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ready/app_styles.dart';
import 'package:rxdart/rxdart.dart';

class CommonAddPhotoWidget extends StatelessWidget {
  CommonAddPhotoWidget({Key? key, this.helperImage}) : super(key: key);
  final BehaviorSubject<File> streamImage = BehaviorSubject();
  final dynamic helperImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<File>(
          stream: streamImage,
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      radius: 50,
                      foregroundImage: Image.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ).image),
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: AppStyles.primary500Color,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        )),
                  ),
                ],
              );
            }
            return InkWell(
              onTap: () {
                getImage();
              },
              child: Container(
                margin: const EdgeInsets.only(right: AppStyles.allMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppStyles.grey50Color),
                width: 90,
                height: 90,
                child: const Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: AppStyles.grey300Color,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final croppedImage = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100);
    streamImage.add(File(croppedImage!.path));
  }
}
```
`To access full code` [Dartpad](https://dartpad.dev/?id=8085e2b2d4377b371a145911866fb21d)
