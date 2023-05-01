import 'package:sign_in_with_stacked/core/services/api_service.dart';
import 'package:sign_in_with_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sign_in_with_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sign_in_with_stacked/ui/views/home/home_view.dart';
import 'package:sign_in_with_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sign_in_with_stacked/ui/views/sign_in_view/sign_in_view_view.dart';
import 'package:sign_in_with_stacked/ui/views/sign_up_view/sign_up_view_view.dart';
import 'package:sign_in_with_stacked/ui/views/otp/otp_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: OtpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
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
