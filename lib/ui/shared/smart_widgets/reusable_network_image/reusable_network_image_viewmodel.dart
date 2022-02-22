import 'package:stacked/stacked.dart';

class ReusableNetworkImageViewModel extends BaseViewModel {
  // final _loadingController = SimpleAnimation('loading');
  // get loadingController => _loadingController;

  void loading(bool loading) {
    // _loadingController.isActive = loading;
  }

  @override
  void dispose() {
    // _loadingController.dispose();
    super.dispose();
  }
}
