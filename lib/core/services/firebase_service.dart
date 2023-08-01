import 'dart:io';
import 'package:intl/intl.dart';
import 'package:messenger_app/data/models/chat_model.dart';
import 'package:messenger_app/data/models/talk_model.dart';
import 'package:messenger_app/presentation/global_widget/items/country.dart';
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

  Future<bool> uploadPhoneNumber(
      {required String phoneNumber, required CountriesPhone country}) async {
    try {
      String userId = auth.currentUser!.uid;
      await db.collection(userColection).doc(userId).update({
        "phone number": phoneNumber,
        "country": "(${country.dialCode}) ${country.name}"
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> uploadTalk(
      {required String name,
      required String imageUrl,
      required String id}) async {
    try {
      await db.collection(talkColection).doc(id).set({
        "name": name,
        "image": imageUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<TalkModel>?> getUserTalk() async {
    final user = (await db.collection(userColection).get());
    final listTalk = user.docs
        .map((e) => TalkModel(
              name: e.data()["name"],
              image: e.data()["image"],
              id: e.id,
            ))
        .toList();
    return listTalk;
  }

  Future<List<TalkModel>?> getTalkMessage() async {
    final user = (await db.collection(talkColection).get());
    final listTalk = user.docs
        .map((e) => TalkModel(
              name: e.data()["name"],
              image: e.data()["image"],
              id: e.id,
              time: e.data()["time"],
              messContent: e.data()["content"],
            ))
        .toList();
    return listTalk;
  }

  Future<bool> uploadContentToTalk({
    required ChatModel chatContent,
    required String id,
  }) async {
    try {
      await db.collection(talkColection).doc(id).update({
        "content": chatContent.content,
        "time": DateFormat.Hm().format(DateTime.now()),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
