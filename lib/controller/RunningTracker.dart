import 'package:get/get.dart';
import 'dart:async';

class TrackingController extends GetxController {
  Stopwatch stopwatch = Stopwatch();
  Timer? _timer;

  // Observables
  var currentTime = '0:00:00'.obs;
  var isRunning = false.obs;
  // Add other observables you might need like distance, pace, etc.

  void startOrStop() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        currentTime.value = _formatDuration(stopwatch.elapsed);
      });
    } else {
      stopwatch.stop();
      isRunning.value = false;
      _timer?.cancel();
    }
    update(); // This will update GetBuilder
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void onClose() {
    _timer?.cancel();
    stopwatch.stop();
    isRunning.value = false;
    super.onClose();
  }
}
