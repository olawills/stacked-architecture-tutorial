import 'package:tutorial_001/core/services/local_storage/persistent_storage.dart';
import 'package:tutorial_001/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tutorial_001/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tutorial_001/ui/views/home/home_view.dart';
import 'package:tutorial_001/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PersistentStorage),
    // @stacked-service
  ],
  logger: StackedLogger(),
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
