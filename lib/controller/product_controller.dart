import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:urban_culture/model/products.dart';

class ProductController extends ChangeNotifier {
  late List<Product> _productList;

  ProductController() {
    _productList = [
      Product(
        title: 'Cleanser',
        subtitle: 'Cetaphil Gentle Skin Cleanser',
        isuploaded: false,
        uploading: false,
        time: '    ',
        id: 1,
      ),
      Product(
        title: 'Toner',
        subtitle: 'Thayers Witch Hazel Toner',
        isuploaded: false,
        uploading: false,
        time: '',
        id: 2,
      ),
      Product(
        title: 'Moisturizer',
        subtitle: 'Kiehls Ultra Facial Cream',
        isuploaded: false,
        uploading: false,
        time: '',
        id: 3,
      ),
      Product(
        title: 'Sunscreen',
        subtitle: 'Supergoop Unseen Sunscreen SPF 40',
        isuploaded: false,
        uploading: false,
        time: '',
        id: 4,
      ),
      Product(
        title: 'Lip Balm',
        subtitle: 'Glossier Birthday Balm Dotcom',
        isuploaded: false,
        uploading: false,
        time: '',
        id: 5,
      ),
    ];
  }

  List<Product> get productList => _productList;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickAndUploadImage(Product product) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    Product productToUpdate = product;
    if (pickedFile != null) {
      productToUpdate.uploading = true;
      notifyListeners();
      try {
        File file = File(pickedFile.path);
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('images')
            .child(fileName)
            .putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask;
        String imageUrl = await taskSnapshot.ref.getDownloadURL();
        productToUpdate.time = DateFormat('hh:mm a').format(DateTime.now());
        log(imageUrl);
        log(productToUpdate.time);
        productToUpdate.isuploaded = true;
        notifyListeners();
        // Do something with the uploaded image URL, like save it or display it.
      } catch (e) {
        productToUpdate.isuploaded = false;
        // Handle errors
        print("Error uploading image: $e");
      } finally {
        productToUpdate.uploading = false;
      }
    } else {
      log("image not selected");
    }
  }
}
