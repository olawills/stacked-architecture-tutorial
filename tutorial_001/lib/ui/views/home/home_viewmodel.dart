import 'package:tutorial_001/app/app.bottomsheets.dart';
import 'package:tutorial_001/app/app.dialogs.dart';
import 'package:tutorial_001/app/app.locator.dart';
import 'package:tutorial_001/core/services/local_storage/persistent_storage.dart';
import 'package:tutorial_001/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  // final _storage = locator<PersistentStorage>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    // _storage.currentState;
    rebuildUi();
    // _storage.currentState;
  }

  void resetCounter() {
    _counter = 0;
    rebuildUi();
  }

  void decrementCounter() {
    _counter--;
    // _storage.getState();
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
