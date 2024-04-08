import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "emotion" field.
  DocumentReference? _emotion;
  DocumentReference? get emotion => _emotion;
  bool hasEmotion() => _emotion != null;

  // "situation" field.
  String? _situation;
  String get situation => _situation ?? '';
  bool hasSituation() => _situation != null;

  // "thoughts" field.
  String? _thoughts;
  String get thoughts => _thoughts ?? '';
  bool hasThoughts() => _thoughts != null;

  // "emotions" field.
  String? _emotions;
  String get emotions => _emotions ?? '';
  bool hasEmotions() => _emotions != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _emotion = snapshotData['emotion'] as DocumentReference?;
    _situation = snapshotData['situation'] as String?;
    _thoughts = snapshotData['thoughts'] as String?;
    _emotions = snapshotData['emotions'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notes')
          : FirebaseFirestore.instance.collectionGroup('notes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('notes').doc(id);

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  DateTime? createdTime,
  DocumentReference? emotion,
  String? situation,
  String? thoughts,
  String? emotions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'emotion': emotion,
      'situation': situation,
      'thoughts': thoughts,
      'emotions': emotions,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.emotion == e2?.emotion &&
        e1?.situation == e2?.situation &&
        e1?.thoughts == e2?.thoughts &&
        e1?.emotions == e2?.emotions;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality().hash(
      [e?.createdTime, e?.emotion, e?.situation, e?.thoughts, e?.emotions]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
