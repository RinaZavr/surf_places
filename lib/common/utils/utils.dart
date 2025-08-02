import 'dart:developer';

import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sharePlace(ScreenshotController screenshotController) async {
  try {
    final image = await screenshotController.capture();

    if (image == null) {
      return;
    }

    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(
            image,
            name: 'phrase_of_day.png',
            mimeType: 'image/png',
          ),
        ],
      ),
    );
  } on Exception catch (e) {
    log('Ошибка при отправке: $e');
  }
}
