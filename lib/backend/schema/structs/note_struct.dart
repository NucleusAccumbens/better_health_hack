// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends FFFirebaseStruct {
  NoteStruct({
    DateTime? createdTime,
    EmotionStruct? emotion,
    String? situation,
    String? thoughts,
    String? emotions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _emotion = emotion,
        _situation = situation,
        _thoughts = thoughts,
        _emotions = emotions,
        super(firestoreUtilData);

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "emotion" field.
  EmotionStruct? _emotion;
  EmotionStruct get emotion => _emotion ?? EmotionStruct();
  set emotion(EmotionStruct? val) => _emotion = val;
  void updateEmotion(Function(EmotionStruct) updateFn) =>
      updateFn(_emotion ??= EmotionStruct());
  bool hasEmotion() => _emotion != null;

  // "situation" field.
  String? _situation;
  String get situation => _situation ?? '';
  set situation(String? val) => _situation = val;
  bool hasSituation() => _situation != null;

  // "thoughts" field.
  String? _thoughts;
  String get thoughts => _thoughts ?? '';
  set thoughts(String? val) => _thoughts = val;
  bool hasThoughts() => _thoughts != null;

  // "emotions" field.
  String? _emotions;
  String get emotions => _emotions ?? '';
  set emotions(String? val) => _emotions = val;
  bool hasEmotions() => _emotions != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        createdTime: data['created_time'] as DateTime?,
        emotion: EmotionStruct.maybeFromMap(data['emotion']),
        situation: data['situation'] as String?,
        thoughts: data['thoughts'] as String?,
        emotions: data['emotions'] as String?,
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map ? NoteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'emotion': _emotion?.toMap(),
        'situation': _situation,
        'thoughts': _thoughts,
        'emotions': _emotions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'emotion': serializeParam(
          _emotion,
          ParamType.DataStruct,
        ),
        'situation': serializeParam(
          _situation,
          ParamType.String,
        ),
        'thoughts': serializeParam(
          _thoughts,
          ParamType.String,
        ),
        'emotions': serializeParam(
          _emotions,
          ParamType.String,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        emotion: deserializeStructParam(
          data['emotion'],
          ParamType.DataStruct,
          false,
          structBuilder: EmotionStruct.fromSerializableMap,
        ),
        situation: deserializeParam(
          data['situation'],
          ParamType.String,
          false,
        ),
        thoughts: deserializeParam(
          data['thoughts'],
          ParamType.String,
          false,
        ),
        emotions: deserializeParam(
          data['emotions'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteStruct &&
        createdTime == other.createdTime &&
        emotion == other.emotion &&
        situation == other.situation &&
        thoughts == other.thoughts &&
        emotions == other.emotions;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdTime, emotion, situation, thoughts, emotions]);
}

NoteStruct createNoteStruct({
  DateTime? createdTime,
  EmotionStruct? emotion,
  String? situation,
  String? thoughts,
  String? emotions,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NoteStruct(
      createdTime: createdTime,
      emotion: emotion ?? (clearUnsetFields ? EmotionStruct() : null),
      situation: situation,
      thoughts: thoughts,
      emotions: emotions,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NoteStruct? updateNoteStruct(
  NoteStruct? note, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    note
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNoteStructData(
  Map<String, dynamic> firestoreData,
  NoteStruct? note,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (note == null) {
    return;
  }
  if (note.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && note.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final noteData = getNoteFirestoreData(note, forFieldValue);
  final nestedData = noteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = note.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNoteFirestoreData(
  NoteStruct? note, [
  bool forFieldValue = false,
]) {
  if (note == null) {
    return {};
  }
  final firestoreData = mapToFirestore(note.toMap());

  // Handle nested data for "emotion" field.
  addEmotionStructData(
    firestoreData,
    note.hasEmotion() ? note.emotion : null,
    'emotion',
    forFieldValue,
  );

  // Add any Firestore field values
  note.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNoteListFirestoreData(
  List<NoteStruct>? notes,
) =>
    notes?.map((e) => getNoteFirestoreData(e, true)).toList() ?? [];
