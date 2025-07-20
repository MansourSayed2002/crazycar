import 'package:flutter/material.dart';

extension NavigatorApp on BuildContext {
  push(pageRoute) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => pageRoute));
  }

  pushRepalceMent(pageRoute) {
    Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (context) => pageRoute));
  }

  removeUntile(pageRoute) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => pageRoute),
      (route) => false,
    );
  }

  pop() => Navigator.of(this).pop();
}
