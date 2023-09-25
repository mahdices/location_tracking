import 'package:get/state_manager.dart';

class BaseController extends GetxController {
  final _loading = false.obs;
  setLoadingState(bool value) {
    _loading.value = value;
  }

  RxBool get isLoading => _loading;
}
