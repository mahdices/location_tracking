import 'package:get/state_manager.dart';

class BaseController extends GetxController {
  final _loading = false.obs;
  setLoadingState(bool value) {
    _loading.value = value;
  }

  get isLoading => _loading;
}
