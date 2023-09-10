import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Classifier {
  late File imageFile;
  late List outputs;

  Future<List?> getDisease(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    imageFile = File(image!.path);
    await loadModel();
    var result = await classifyImage(imageFile);
    Tflite.close();
    return result;
  }

  String getRandomDisease(List<String> diseaseList) {
    Random random = Random();
    int randomIndex = random.nextInt(diseaseList.length);
    return diseaseList[randomIndex];
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/mobile_aug.tflite",
      labels: "assets/model/labels.txt",
      numThreads: 1,
    );
  }

  Future<List?> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    return output;
  }
}
