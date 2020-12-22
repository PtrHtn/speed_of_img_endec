import 'dart:io';
import 'package:executorservices/executorservices.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:get/get.dart';

class ResultsController extends GetxController{
  ExecutorService executorService;
  static const MethodChannel methodChannel = const MethodChannel('speed_of_img_endec');

  @override
  void onReady() async {
    super.onReady();
    await dartImageEnDec(Get.arguments[0]);
    await javaImageEnDec(Get.arguments[0]);
  }
  final jumpingDots = true.obs;
  final dartQueuingImageDecoding = true.obs;
  final dartQueuingJpgEncoding = true.obs;
  final dartQueuingPngEncoding = true.obs;
  final dartImageDecoded = false.obs;
  final dartJpgEncoded = false.obs;
  final dartPngEncoded = false.obs;
  final dartTimeOfImageDecoding = 0.0.obs;
  final dartTimeOfJpgEncoding = 0.0.obs;
  final dartTimeOfPngEncoding = 0.0.obs;

  final javaQueuingImageDecoding = true.obs;
  final javaQueuingJpgEncoding = true.obs;
  final javaQueuingPngEncoding = true.obs;
  final javaImageDecoded = false.obs;
  final javaJpgEncoded = false.obs;
  final javaPngEncoded = false.obs;
  final javaTimeOfImageDecoding = 0.0.obs;
  final javaTimeOfJpgEncoding = 0.0.obs;
  final javaTimeOfPngEncoding = 0.0.obs;

  Future dartImageEnDec(String imageFilepath) async {
    executorService ??= ExecutorService.newSingleExecutor();

    dartQueuingImageDecoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final aa = Stopwatch()..start();

    // final decodedImage = decodeImage(File(imageFilepath).readAsBytesSync());
    final decodedImage = await executorService.submitCallable(dartImageDecoding, imageFilepath);

    dartTimeOfImageDecoding.value = (aa.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Dart image decoding took: ${dartTimeOfImageDecoding.value} seconds');

    dartImageDecoded.value = true;

    dartQueuingJpgEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ab = Stopwatch()..start();
    // encodeJpg(decodedImage);
    await executorService.submitCallable(dartJpgEncoding, decodedImage);
    dartTimeOfJpgEncoding.value = (ab.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Dart jpg encoding took: ${dartTimeOfJpgEncoding.value} seconds');
    dartJpgEncoded.value = true;

    dartQueuingPngEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    final ac = Stopwatch()..start();
    // encodePng(decodedImage);
    await executorService.submitCallable(dartPngEncoding, decodedImage);
    dartTimeOfPngEncoding.value = (ac.elapsed.inMilliseconds / 1000).toPrecision(1);
    print('\n > Dart png encoding took: ${dartTimeOfPngEncoding.value} seconds');
    dartPngEncoded.value = true;

    if (executorService != null) {
      executorService.shutdown();
    }

  }

  static Future<Image> dartImageDecoding(String imagePath) async {

    if (File(imagePath).existsSync() == false) {
      print('\n***\n\tFile at "$imagePath" does not exist.\n***\n');
    } else {
      return decodeImage(File(imagePath).readAsBytesSync());
    }
  }

  static Future<void> dartJpgEncoding(Image decodedImage) async {

    if (decodedImage.isNullOrBlank) {
      print('\n***\n\tDecoded image is null or blank.\n***\n');
    } else {
      encodeJpg(decodedImage);
    }
  }

  static Future<void> dartPngEncoding(Image decodedImage) async {

    if (decodedImage.isNullOrBlank) {
      print('\n***\n\tDecoded image is null or blank.\n***\n');
    } else {
      encodePng(decodedImage);
    }
  }

  Future javaImageEnDec(String imageFilepath) async {

    javaQueuingImageDecoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    javaTimeOfImageDecoding.value = (await javaImageDecoding(imageFilepath) / 1000).toPrecision(2);
    print('\n > Java image decoding took: ${javaTimeOfImageDecoding.value} seconds');

    javaImageDecoded.value = true;

    javaQueuingJpgEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    javaTimeOfJpgEncoding.value = (await javaJpgEncoding(imageFilepath) / 1000).toPrecision(2);
    print('\n > Java jpg encoding took: ${javaTimeOfJpgEncoding.value} seconds');
    javaJpgEncoded.value = true;

    javaQueuingPngEncoding.value = false;

    await Future.delayed(const Duration(milliseconds: 500));

    javaTimeOfPngEncoding.value = (await javaPngEncoding(imageFilepath) / 1000).toPrecision(2);
    print('\n > Java png encoding took: ${javaTimeOfPngEncoding.value} seconds');
    javaPngEncoded.value = true;
    jumpingDots.value = false;
  }

  static Future<int> javaImageDecoding(String imageFilepath) async {
    return await methodChannel.invokeMethod(
        'imageDecoding',
        <String, dynamic>{'imageFilepath': imageFilepath}
        );
  }

  static Future<int> javaJpgEncoding(String imageFilepath) async {
    return await methodChannel.invokeMethod(
        'jpgEncoding',
        <String, dynamic>{'imageFilepath': imageFilepath}
    );
  }

  static Future<int> javaPngEncoding(String imageFilepath) async {
    return await methodChannel.invokeMethod(
        'pngEncoding',
        <String, dynamic>{'imageFilepath': imageFilepath}
    );
  }
}