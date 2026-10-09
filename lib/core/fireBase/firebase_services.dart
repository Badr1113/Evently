import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class FirebaseServices {
  static String _dbUsersKey = "Users";
  static Future<UserCredential> createAccount(
    String email,
    String password,
  ) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> logIn(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static CollectionReference<UserModel> get _getUserColleciton {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection(_dbUsersKey)
        .withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) async {
    CollectionReference<UserModel> usersCollection = _getUserColleciton;
    DocumentReference<UserModel> usersDocument = usersCollection.doc(user.id);

    await usersDocument.set(user);
  }

  static Future<UserModel> getUserFromFirebase(String userID) async {
    CollectionReference<UserModel> usersCollection = _getUserColleciton;
    DocumentReference<UserModel> usersDocument = usersCollection.doc(userID);

    DocumentSnapshot<UserModel> documentSnapshot = await usersDocument.get();
    return documentSnapshot.data()!;
  }
}
 
/*
  * This is old 
  * We Upgrade It
 static Future<void> addUserToFireStore(UserModel user) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
      _dbUsersKey,
    );
    DocumentReference<Map<String, dynamic>> usersDocument = usersCollection.doc(
      user.id,
    );
    await usersDocument.set(user.toJson());
  }

  static Future<UserModel> getUserFromFirebase(String userID) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
      _dbUsersKey,
    );
    DocumentReference<Map<String, dynamic>> usersDocument = usersCollection.doc(
      userID,
    );
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await usersDocument.get();
    Map<String, dynamic> jsonData = documentSnapshot.data()!;
    return UserModel.fromJson(jsonData);
  }
}

*/
