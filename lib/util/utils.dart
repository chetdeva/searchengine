import 'dart:async';

import 'package:flutter/material.dart';

class ImageUtils {
  static ImageProvider applyImage(
      String imageUrl, String placeholderAssetPath) {
    if (imageUrl != null) {
      return NetworkImage(imageUrl);
    } else {
      return AssetImage(placeholderAssetPath);
    }
  }
}

class DialogUtils {
  static Future<Null> showOkDialog({
    @required BuildContext context,
    @required String title,
    @required String content,
    @required VoidCallback onOkPressed,
  }) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: onOkPressed,
            ),
          ],
        );
      },
    );
  }
}

class NotificationUtils {

}
