import 'package:tutorial_001/core/services/hive_boxes.dart';
import 'package:tutorial_001/core/services/local_storage/local_storage.dart';

const String _currentState = 'currentState';
// int _intCurrentState = 0;

class PersistentStorage extends LocalStorageService {
  PersistentStorage() : super(persistBox, 'PersistentStorage');

  // Persist the counter

   bool get currentState => getData(_currentState);
  set currentState(bool value) => saveData(_currentState, value);

  get removeState => deleteData(_currentState);
  set newState(bool value) => saveData(removeState, value);
}
