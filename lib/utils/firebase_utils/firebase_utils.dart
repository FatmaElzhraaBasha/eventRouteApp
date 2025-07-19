import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    ///3shan mesh koll mara a7tag collection arro7 a3mloh fe fun ,
    ///keda 3mltoh mara wahda w2t ma a7tagoh aro7 anady 3lih
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event) {
    //dah e5tsar ll5twat ehhy t7t
    /// getEventCollection().doc().set(event);
    ///
    var eventCollection = getEventCollection(); //collection
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id; //auto id
    return docRef.set(event);
  }
}
