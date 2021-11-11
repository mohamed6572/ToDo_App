// related functions to firstore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/data/Todo.dart';

extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}

CollectionReference<Todo> getTodosCollectionWithConverter() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionName)
      .withConverter<Todo>(
          fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
          toFirestore: (item, _) => item.toJson());
}

Future<void> addTodoToFirstore(
    String title, String description, DateTime time) {
  CollectionReference<Todo> collectionReference =
      getTodosCollectionWithConverter();
  DocumentReference<Todo> docRef = collectionReference.doc();

  Todo item = Todo(
      id: docRef.id,
      title: title,
      description: description,
      dateTime: time.getDateOnly());
  return docRef.set(item);
}

Future<void> deleteTodo(Todo item) {
  CollectionReference<Todo> collectionReference =
      getTodosCollectionWithConverter();
  DocumentReference<Todo> itemDoc = collectionReference.doc(item.id);
  return itemDoc.delete();
}
