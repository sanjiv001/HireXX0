import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hirexxo/model/apartment.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';

class DBServices {
  final CollectionReference buildingcol =
      FirebaseFirestore.instance.collection("building");

  final CollectionReference carouselcol =
      FirebaseFirestore.instance.collection("carousel");

  Future savebuilding(Building building) async {
    try {
      await buildingcol.doc().set(building.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> uploadImage(File file, {String? path}) async {
    var time = DateTime.now().toString();
    var ext = Path.basename(file.path).split(".")[1].toString();
    String image = path! + "_" + time + "." + ext;
    try {
      Reference ref = FirebaseStorage.instance.ref().child(path + "/" + image);
      UploadTask upload = ref.putFile(file);
      await upload.whenComplete;
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }
}
