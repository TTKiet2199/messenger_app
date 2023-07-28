import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String userColection = "users";
  String talkColection = "talk";

  Map? currentUser;
  FirebaseService();

  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String userID = userCredential.user!.uid;
      await db.collection(userColection).doc(userID).set({
        "name": name,
        "email": email,
      });
      currentUser = await getUserData(uid: userID);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUsers(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        currentUser = await getUserData(uid: userCredential.user!.uid);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map> getUserData({required String uid}) async {
    DocumentSnapshot _doc = await db.collection(userColection).doc(uid).get();
    return _doc.data() as Map;
  }

  Future<bool> uploadImage({required File image}) async {
    try {
      String userId = auth.currentUser!.uid;
      String fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      UploadTask task = storage.ref('image/$userId/$fileName').putFile(image);
      return task.then((snapshot) async {
        String downloadURL = await snapshot.ref.getDownloadURL();
        await db.collection(userColection).doc(userId).update({
          "image": downloadURL,
        });
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> uploadTalk({
    required String name,
    required File image,
    required String content,
  }) async {
    try {
      String userId = auth.currentUser!.uid;
      String fileName = Timestamp.now().millisecondsSinceEpoch.toString() +
          p.extension(image.path);
      UploadTask task = storage.ref('image/$userId/$fileName').putFile(image);
      return task.then((snapshot) async {
        String downloadURL = await snapshot.ref.getDownloadURL();
        await db.collection(talkColection).doc(userId).set({
          "name": name,
          "content": content,
          "image": downloadURL,
        });
        return true;
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<QuerySnapshot> getUser() {
    return db.collection(userColection).snapshots();
  }
  // Future<Map> getUsers() async {
  //   DocumentSnapshot user = (await db.collection(userColection).get()) as DocumentSnapshot;
  //   return user.data() as Map;
  // }
}
