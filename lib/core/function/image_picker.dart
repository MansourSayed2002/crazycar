import 'dart:developer';
import 'package:image_picker/image_picker.dart';

imagePicker(bool isgallery) async {
  XFile? image = await ImagePicker().pickImage(
    source: isgallery ? ImageSource.gallery : ImageSource.camera,
  );
  if (image != null) {
    log(image.path);
    return image.path;
  }
}

// filePicker({
//   required bool allowedMultiple,
//   List<String>? allowedExtensions,
// }) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     allowMultiple: true,
//     type: FileType.custom,
//     allowedExtensions: allowedExtensions,
//   );
//   if (result != null) {
//     List<File> files = result.paths.map((path) => File(path!)).toList();
//     return files;
//   }
// }
