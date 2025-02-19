import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/models/event_model.dart';
import 'package:todo/models/userModel.dart';

class FirebaseManager {
  /// Collection of Events
  static CollectionReference<EventModel> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) {
        return EventModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Collection of Users
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Create Event Function
  static Future<void> addEvent(EventModel model) {
    var createEventCollection = getEventsCollection();
    var docRef = createEventCollection.doc();
    model.id = docRef.id;
    return docRef.set(model);
    // .catchError((error) => print("Failed to add event: $error"));
  }

  ///Create User Function
  static Future<void> addUser(UserModel model) {
    var createUserCollection = getUsersCollection();
    var docRef = createUserCollection.doc(model.id);
    return docRef.set(model);
  }

  /// Get Event Function
  static Stream<QuerySnapshot<EventModel>> getEvent(String categoryName) {
    var getEventCollection = getEventsCollection();
    if (categoryName == "All") {
      return getEventCollection
          .orderBy("date")
          .where(
            "userId",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
          )
          .snapshots();
    } else {
      return getEventCollection
          .orderBy("date")
          .where(
            "userId",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
          )
          .where("category", isEqualTo: categoryName)
          .snapshots();
    }
  }

  /// Get Favorite Event Function
  static Stream<QuerySnapshot<EventModel>> getFavoriteEvent() {
    var getFavoriteEventCollection = getEventsCollection();
    return getFavoriteEventCollection
        .orderBy("date")
        .where(
          "isFavorite",
          isEqualTo: true,
        )
        .snapshots();
  }

  /// Get User Function
  static Future<UserModel?> getUserData(String id) async {
    var getUserCollection = getUsersCollection();
    DocumentSnapshot<UserModel> snapShot =
        await getUserCollection.doc(id).get();
    return snapShot.data();
  }

  /// Delete Event Function

  static Future<void> deleteEvent(String eventId) {
    var deleteEventCollection = getEventsCollection();
    return deleteEventCollection.doc(eventId).delete();
    // .catchError((error) => print("Failed to add event: $error"));
  }

  /// Update Event Function

  static Future<void> updateEvent(EventModel model, String eventId) {
    var updateEventCollection = getEventsCollection();
    return updateEventCollection.doc(eventId).update(model.toJson());
  }

  // static Future<void> updateEvent(EventModel model) {
  //   var updateEventCollection = getEventsCollection();
  //   return updateEventCollection.doc(model.id).update(model.toJson());
  // }

  /// Authenticates
  /// Register
  static Future<void> createUser(String email, String password, String name,
      Function onSuccess, Function onError, Function onLoading) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel model = UserModel(
        name: name,
        email: email,
        id: credential.user!.uid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await addUser(model);
      // verified = credential.user!.emailVerified;
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('the_password_provided_is_too_weak'.tr());
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        // print('the_account_already_exists_for_tha_email.'.tr());
        onError(e.message);
      }
    } catch (error) {
      onError("something_went_wrong".tr());
      // print(error);
    }
  }

  /// Login
  static Future<void> loginUser(String email, String password,
      Function onSuccess, Function onError, Function onLoading) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError(
            "email_is_not_verified_please_check_your_mail_and_try_again".tr());
      }
    } on FirebaseAuthException catch (_) {
      onError("email_or_password_is_not_valid".tr());
    }
  }

  ///SignOut

  static Future<void> signOutUser() async {
    return await FirebaseAuth.instance.signOut();
  }
}
