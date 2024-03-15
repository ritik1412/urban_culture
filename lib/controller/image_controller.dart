// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class ImageController extends GetxController {
//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickAndUploadImage(int id) async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       isuploading.value = true;
//       try {
//         File file = File(pickedFile.path);
//         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//         UploadTask uploadTask = FirebaseStorage.instance
//             .ref()
//             .child('images')
//             .child(fileName)
//             .putFile(file);
//         TaskSnapshot taskSnapshot = await uploadTask;
//         String imageUrl = await taskSnapshot.ref.getDownloadURL();
//         time.value = DateFormat('hh:mm a').format(DateTime.now());
//         log(imageUrl);
//         log(time.value);
//         Get.snackbar(
//           'Success',
//           'Image uploaded successfully!',
//           snackPosition: SnackPosition.BOTTOM,
//         );

//         // Do something with the uploaded image URL, like save it or display it.
//       } catch (e) {
//         // Handle errors
//         print("Error uploading image: $e");
//       } finally {
//         isuploading.value = false;
//       }
//     } else {
//       log("image not selected");
//     }
//   }
// }
