import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/event.dart';
import '../../model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection(String uId) {
    ///3shan mesh koll mara a7tag collection arro7 a3mloh fe fun ,
    ///keda 3mltoh mara wahda w2t ma a7tagoh aro7 anady 3lih
    return getUsersCollection()
        .doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event, String uId) {
    //dah e5tsar ll5twat ehhy t7t
    /// getEventCollection().doc().set(event);
    ///
    var eventCollection = getEventCollection(uId); //collection
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id; //auto id
    return docRef.set(event);
  }

  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (myUser, options) => myUser.toFireStore(),
        );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUsersFromFireStore(String id) async {
    var querySnapshot = await getUsersCollection().doc(id).get();
    return querySnapshot.data();
  }
}
