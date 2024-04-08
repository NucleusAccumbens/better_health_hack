// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmotionStruct extends FFFirebaseStruct {
  EmotionStruct({
    String? name,
    String? hexColor,
    String? textHexColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _hexColor = hexColor,
        _textHexColor = textHexColor,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "hex_color" field.
  String? _hexColor;
  String get hexColor => _hexColor ?? '';
  set hexColor(String? val) => _hexColor = val;
  bool hasHexColor() => _hexColor != null;

  // "text_hex_color" field.
  String? _textHexColor;
  String get textHexColor => _textHexColor ?? '';
  set textHexColor(String? val) => _textHexColor = val;
  bool hasTextHexColor() => _textHexColor != null;

  static EmotionStruct fromMap(Map<String, dynamic> data) => EmotionStruct(
        name: data['name'] as String?,
        hexColor: data['hex_color'] as String?,
        textHexColor: data['text_hex_color'] as String?,
      );

  static EmotionStruct? maybeFromMap(dynamic data) =>
      data is Map ? EmotionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'hex_color': _hexColor,
        'text_hex_color': _textHexColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'hex_color': serializeParam(
          _hexColor,
          ParamType.String,
        ),
        'text_hex_color': serializeParam(
          _textHexColor,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmotionStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmotionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        hexColor: deserializeParam(
          data['hex_color'],
          ParamType.String,
          false,
        ),
        textHexColor: deserializeParam(
          data['text_hex_color'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmotionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmotionStruct &&
        name == other.name &&
        hexColor == other.hexColor &&
        textHexColor == other.textHexColor;
  }

  @override
  int get hashCode => const ListEquality().hash([name, hexColor, textHexColor]);
}

EmotionStruct createEmotionStruct({
  String? name,
  String? hexColor,
  String? textHexColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmotionStruct(
      name: name,
      hexColor: hexColor,
      textHexColor: textHexColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmotionStruct? updateEmotionStruct(
  EmotionStruct? emotion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    emotion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmotionStructData(
  Map<String, dynamic> firestoreData,
  EmotionStruct? emotion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (emotion == null) {
    return;
  }
  if (emotion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && emotion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final emotionData = getEmotionFirestoreData(emotion, forFieldValue);
  final nestedData = emotionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = emotion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmotionFirestoreData(
  EmotionStruct? emotion, [
  bool forFieldValue = false,
]) {
  if (emotion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(emotion.toMap());

  // Add any Firestore field values
  emotion.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmotionListFirestoreData(
  List<EmotionStruct>? emotions,
) =>
    emotions?.map((e) => getEmotionFirestoreData(e, true)).toList() ?? [];
