import 'package:crazycar/core/constants/text_app.dart';
import 'package:easy_localization/easy_localization.dart';

validationField(String type, int min, int max, value) {
  if (type == "Phone") {
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
      return TextApp.wrongNumber.tr();
    }
  }
  if (type == "text") {
    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value)) {
      return TextApp.wrongText.tr();
    }
  }
  if (type == "email") {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return TextApp.wrongEmail.tr();
    }
  }
  // if (type == "numtext") {
  //   if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
  //     return "من فضلك ادخل الارقام الصحيحه";
  //   }
  // }
  if (value.isEmpty) {
    return TextApp.wrongEmpty.tr();
  } else if (value.length > max) {
    return "${TextApp.wrongMax.tr()} $max";
  } else if (value.length < min) {
    return "${TextApp.wrongMin.tr()} $min";
  }
}
