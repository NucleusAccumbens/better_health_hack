import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _emotionsAudio = prefs.getString('ff_emotionsAudio') ?? _emotionsAudio;
    });
    _safeInit(() {
      _thoughtsAudio = prefs.getString('ff_thoughtsAudio') ?? _thoughtsAudio;
    });
    _safeInit(() {
      _eventRecordingStarted =
          prefs.getBool('ff_eventRecordingStarted') ?? _eventRecordingStarted;
    });
    _safeInit(() {
      _eventRecordingCompleted = prefs.getBool('ff_eventRecordingCompleted') ??
          _eventRecordingCompleted;
    });
    _safeInit(() {
      _emotionsRecordingStarted =
          prefs.getBool('ff_emotionsRecordingStarted') ??
              _emotionsRecordingStarted;
    });
    _safeInit(() {
      _emotionsRecordingCompleted =
          prefs.getBool('ff_emotionsRecordingCompleted') ??
              _emotionsRecordingCompleted;
    });
    _safeInit(() {
      _emotionChosen = prefs.getBool('ff_emotionChosen') ?? _emotionChosen;
    });
    _safeInit(() {
      _thoughtsRecordingStarted =
          prefs.getBool('ff_thoughtsRecordingStarted') ??
              _thoughtsRecordingStarted;
    });
    _safeInit(() {
      _thoughtsRecordingCompleted =
          prefs.getBool('ff_thoughtsRecordingCompleted') ??
              _thoughtsRecordingCompleted;
    });
    _safeInit(() {
      _eventAudio = prefs.getString('ff_eventAudio') ?? _eventAudio;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_emotion')) {
        try {
          final serializedData = prefs.getString('ff_emotion') ?? '{}';
          _emotion =
              EmotionStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _recordingDate = prefs.containsKey('ff_recordingDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_recordingDate')!)
          : _recordingDate;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_note')) {
        try {
          final serializedData = prefs.getString('ff_note') ?? '{}';
          _note = NoteStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _notes = prefs
              .getStringList('ff_notes')
              ?.map((x) {
                try {
                  return NoteStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _notes;
    });
    _safeInit(() {
      _noteAded = prefs.getBool('ff_noteAded') ?? _noteAded;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _emotionsAudio = '';
  String get emotionsAudio => _emotionsAudio;
  set emotionsAudio(String _value) {
    _emotionsAudio = _value;
    prefs.setString('ff_emotionsAudio', _value);
  }

  String _thoughtsAudio = '';
  String get thoughtsAudio => _thoughtsAudio;
  set thoughtsAudio(String _value) {
    _thoughtsAudio = _value;
    prefs.setString('ff_thoughtsAudio', _value);
  }

  bool _eventRecordingStarted = false;
  bool get eventRecordingStarted => _eventRecordingStarted;
  set eventRecordingStarted(bool _value) {
    _eventRecordingStarted = _value;
    prefs.setBool('ff_eventRecordingStarted', _value);
  }

  bool _eventRecordingCompleted = false;
  bool get eventRecordingCompleted => _eventRecordingCompleted;
  set eventRecordingCompleted(bool _value) {
    _eventRecordingCompleted = _value;
    prefs.setBool('ff_eventRecordingCompleted', _value);
  }

  bool _emotionsRecordingStarted = false;
  bool get emotionsRecordingStarted => _emotionsRecordingStarted;
  set emotionsRecordingStarted(bool _value) {
    _emotionsRecordingStarted = _value;
    prefs.setBool('ff_emotionsRecordingStarted', _value);
  }

  bool _emotionsRecordingCompleted = false;
  bool get emotionsRecordingCompleted => _emotionsRecordingCompleted;
  set emotionsRecordingCompleted(bool _value) {
    _emotionsRecordingCompleted = _value;
    prefs.setBool('ff_emotionsRecordingCompleted', _value);
  }

  bool _emotionChosen = false;
  bool get emotionChosen => _emotionChosen;
  set emotionChosen(bool _value) {
    _emotionChosen = _value;
    prefs.setBool('ff_emotionChosen', _value);
  }

  bool _thoughtsRecordingStarted = false;
  bool get thoughtsRecordingStarted => _thoughtsRecordingStarted;
  set thoughtsRecordingStarted(bool _value) {
    _thoughtsRecordingStarted = _value;
    prefs.setBool('ff_thoughtsRecordingStarted', _value);
  }

  bool _thoughtsRecordingCompleted = false;
  bool get thoughtsRecordingCompleted => _thoughtsRecordingCompleted;
  set thoughtsRecordingCompleted(bool _value) {
    _thoughtsRecordingCompleted = _value;
    prefs.setBool('ff_thoughtsRecordingCompleted', _value);
  }

  String _eventAudio = '';
  String get eventAudio => _eventAudio;
  set eventAudio(String _value) {
    _eventAudio = _value;
    prefs.setString('ff_eventAudio', _value);
  }

  EmotionStruct _emotion = EmotionStruct.fromSerializableMap(jsonDecode(
      '{\"name\":\"fear\",\"hex_color\":\"#3C81E8\",\"text_hex_color\":\"#FFD178\"}'));
  EmotionStruct get emotion => _emotion;
  set emotion(EmotionStruct _value) {
    _emotion = _value;
    prefs.setString('ff_emotion', _value.serialize());
  }

  void updateEmotionStruct(Function(EmotionStruct) updateFn) {
    updateFn(_emotion);
    prefs.setString('ff_emotion', _emotion.serialize());
  }

  DateTime? _recordingDate = DateTime.fromMillisecondsSinceEpoch(1708516260000);
  DateTime? get recordingDate => _recordingDate;
  set recordingDate(DateTime? _value) {
    _recordingDate = _value;
    _value != null
        ? prefs.setInt('ff_recordingDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_recordingDate');
  }

  NoteStruct _note = NoteStruct.fromSerializableMap(jsonDecode(
      '{\"created_time\":\"1708078800000\",\"emotion\":\"{\\\"name\\\":\\\"fear\\\",\\\"hex_color\\\":\\\"#3C81E8\\\",\\\"text_hex_color\\\":\\\"#FFD178\\\"}\",\"situation\":\"Today, during a team meeting at work, my idea was criticized by several colleagues. They pointed out what they perceived as flaws in my proposal, suggesting alternative approaches that significantly differed from my original idea.\",\"thoughts\":\"Feeling a mix of disappointment and defensiveness, I found it challenging to remain composed. However, there\'s also a part of me that recognizes the importance of feedback for growth, even though it\'s difficult to accept in the moment.\",\"emotions\":\"Initially, I felt my idea was strong and would be beneficial for the project, so the criticism was unexpected. I couldn\'t help but wonder if my colleagues view me as less competent, or if my ability to contribute valuable ideas is diminishing.\"}'));
  NoteStruct get note => _note;
  set note(NoteStruct _value) {
    _note = _value;
    prefs.setString('ff_note', _value.serialize());
  }

  void updateNoteStruct(Function(NoteStruct) updateFn) {
    updateFn(_note);
    prefs.setString('ff_note', _note.serialize());
  }

  List<NoteStruct> _notes = [];
  List<NoteStruct> get notes => _notes;
  set notes(List<NoteStruct> _value) {
    _notes = _value;
    prefs.setStringList('ff_notes', _value.map((x) => x.serialize()).toList());
  }

  void addToNotes(NoteStruct _value) {
    _notes.add(_value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeFromNotes(NoteStruct _value) {
    _notes.remove(_value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNotes(int _index) {
    _notes.removeAt(_index);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void updateNotesAtIndex(
    int _index,
    NoteStruct Function(NoteStruct) updateFn,
  ) {
    _notes[_index] = updateFn(_notes[_index]);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNotes(int _index, NoteStruct _value) {
    _notes.insert(_index, _value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  bool _noteAded = false;
  bool get noteAded => _noteAded;
  set noteAded(bool _value) {
    _noteAded = _value;
    prefs.setBool('ff_noteAded', _value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
