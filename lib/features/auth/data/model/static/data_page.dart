import 'package:crazycar/core/constants/image_app.dart';
import 'package:crazycar/core/constants/text_app.dart';
import 'package:easy_localization/easy_localization.dart';

class DataPageModel {
  final String description;
  final String image;
  DataPageModel({required this.description, required this.image});
}

List<DataPageModel> dataPage = [
  DataPageModel(description: TextApp.desPage1.tr(), image: ImageApp.page1),
  DataPageModel(description: TextApp.desPage2.tr(), image: ImageApp.page2),
  DataPageModel(description: TextApp.desPage3.tr(), image: ImageApp.page3),
];
