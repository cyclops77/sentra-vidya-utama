import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static fPrepares({String msg}) {
    return EasyLoading.show(
      dismissOnTap: false,
      status: msg,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static fLoading({bool isClosesable, String msg}) {
    return EasyLoading.show(
      dismissOnTap: isClosesable,
      status: msg,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static fSuccess({String msg}) {
    return EasyLoading.showSuccess(msg,
        dismissOnTap: true,
        duration: Duration(seconds: 2),
        maskType: EasyLoadingMaskType.black);
  }

  static fFails({String msg}) {
    return EasyLoading.showError(msg,
        dismissOnTap: true,
        duration: Duration(seconds: 2),
        maskType: EasyLoadingMaskType.black);
  }

  static fClose() {
    return EasyLoading.dismiss();
  }
}
