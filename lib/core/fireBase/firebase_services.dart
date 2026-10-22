import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/Models/event_model.dart';
import 'package:evently/core/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseServices {
  static String _dbUsersKey = "Users";
  static String _dbEventKey = "Events";
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

  static CollectionReference<EventModel> get _getEventsCollection {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection(_dbEventKey)
        .withConverter(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (event, _) => EventModel.toJson(event),
        );
    return eventsCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) async {
    CollectionReference<UserModel> usersCollection = _getUserColleciton;
    DocumentReference<UserModel> usersDocument = usersCollection.doc(user.id);
    await usersDocument.set(user);
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

  static Future<UserModel> getUserFromFireStore(String userID) async {
    CollectionReference<UserModel> usersCollection = _getUserColleciton;
    DocumentReference<UserModel> usersDocument = usersCollection.doc(userID);

    DocumentSnapshot<UserModel> documentSnapshot = await usersDocument.get();
    return documentSnapshot.data()!;
  }

  static Future<void> addEventToFireStore(EventModel event) async {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection;
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    await eventDocument.set(event);
  }

  static Stream<List<EventModel>> getEventsRealTimeFromFireStore() async* {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection;
    Stream<QuerySnapshot<EventModel>> collectionSnapshots = eventsCollection
        .snapshots();
    Stream<List<EventModel>> events = collectionSnapshots.map(
      (querySnapshot) => querySnapshot.docs
          .map((documentSnapshot) => documentSnapshot.data())
          .toList(),
    );
    yield* events;
  }

  static Future<UserCredential> googleAuth() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();
    GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> logout() async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
