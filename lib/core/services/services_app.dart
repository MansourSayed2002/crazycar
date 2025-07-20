import 'package:easy_localization/easy_localization.dart';

class ServicesApp {
  static Future<void> init() async {
     await EasyLocalization.ensureInitialized();
  }
}
