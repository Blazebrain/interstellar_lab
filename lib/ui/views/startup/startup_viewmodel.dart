import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();

  void setup() async {
    await runBusyFuture(runTask());
  }

  Future<void> runTask() async {
    // Perform any operation that needs to be instantiated
    // before the app starts here, for now, we just delay for three seconds
    Future.delayed(const Duration(seconds: 3), goToDashboardView);
  }

  void goToDashboardView() {
    _navigationService.pushNamedAndRemoveUntil(Routes.navBarView);
  }
}
