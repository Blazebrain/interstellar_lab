// import 'package:raptures/app/app.locator.dart';
// import 'package:raptures/app/app.router.dart';
// import 'package:raptures/services/user/user.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// //Link this to the appbar one way or the other
// // makes routing to the sSearch or Profile views easier
// class MainAppBarViewModel extends BaseViewModel {
//   final _navigationService = locator<NavigationService>();
//   final _userService = locator<IUser>();

//   Future<void> goToProfileView() async {
//     if (await _userService.checkIfRegistered() == false) {
//       _navigationService.navigateTo(
//         Routes.loginView,
//         arguments: LoginViewArguments(fromInternal: true),
//       );
//       return;
//     }

//     _navigationService.navigateTo(Routes.profileView);
//   }
// }
