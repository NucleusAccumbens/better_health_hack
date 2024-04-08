import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmotionsRecord extends FirestoreRecord {
  EmotionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "hex_color" field.
  String? _hexColor;
  String get hexColor => _hexColor ?? '';
  bool hasHexColor() => _hexColor != null;

  // "text_hex_color" field.
  String? _textHexColor;
  String get textHexColor => _textHexColor ?? '';
  bool hasTextHexColor() => _textHexColor != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _hexColor = snapshotData['hex_color'] as String?;
    _textHexColor = snapshotData['text_hex_color'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emotions');

  static Stream<EmotionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmotionsRecord.fromSnapshot(s));

  static Future<EmotionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmotionsRecord.fromSnapshot(s));

  static EmotionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmotionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmotionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmotionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmotionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmotionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmotionsRecordData({
  String? name,
  String? hexColor,
  String? textHexColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'hex_color': hexColor,
      'text_hex_color': textHexColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmotionsRecordDocumentEquality implements Equality<EmotionsRecord> {
  const EmotionsRecordDocumentEquality();

  @override
  bool equals(EmotionsRecord? e1, EmotionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.hexColor == e2?.hexColor &&
        e1?.textHexColor == e2?.textHexColor;
  }

  @override
  int hash(EmotionsRecord? e) =>
      const ListEquality().hash([e?.name, e?.hexColor, e?.textHexColor]);

  @override
  bool isValidKey(Object? o) => o is EmotionsRecord;
}
