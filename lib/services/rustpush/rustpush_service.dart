
import 'package:bluebubbles/ffi.dart';
import 'package:bluebubbles/services/services.dart';
import 'package:get/get.dart';

RustPushService pushService = Get.isRegistered<RustPushService>() ? Get.find<RustPushService>() : Get.put(RustPushService());

class RustPushService extends GetxService {
  late PushState state;

  @override
  Future<void> onInit() async {
    super.onInit();
    api.newPushState();
    state = await api.newPushState();
    if (ss.settings.rustPushState.value != "") {
      await api.restore(currState: state, data: ss.settings.rustPushState.value);
    } else {
      await api.newPush(state: state);
    }
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }
}