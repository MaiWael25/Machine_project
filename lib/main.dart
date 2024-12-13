import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:ml_project/onboarding_view.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animal Predictor',
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController urlController = TextEditingController();
  String result = 'Prediction result will be shown here';
  String? imageUrl;
  late Interpreter interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      // Load the TFLite model
      interpreter = await Interpreter.fromAsset('assets/animal.tflite');
      debugPrint('Model loaded successfully.');
    } catch (e) {
      debugPrint('Error loading model: $e');
      setState(() {
        result = 'Error loading model: $e';
      });
    }
  }

  Future<void> performAction(String imageUrl) async {
    try {
      // Fetch image from URL
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Decode the image
        Uint8List bytes = response.bodyBytes;
        img.Image? image = img.decodeImage(bytes);
        if (image == null) throw Exception("Invalid image format");

        // Resize the image to the required input size (224x224)
        img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

        // Convert the image to a normalized float32 tensor
        var input = List.generate(
          224,
          (y) => List.generate(
            224,
            (x) {
              var pixel = resizedImage.getPixelSafe(x, y); // Use getPixelSafe
              return [
                pixel.r / 255.0, // Normalize red channel
                pixel.g / 255.0, // Normalize green channel
                pixel.b / 255.0, // Normalize blue channel
              ];
            },
          ),
        );

        // Add batch dimension to input
        var batchedInput = [input];

        // Prepare output tensor
        var output = List.filled(2, 0.0).reshape([1, 2]);

        // Run inference
        interpreter.run(batchedInput, output);

        // Process output
        // Assuming output[0][0] is for Cat and output[0][1] is for Dog
        int predictedIndex = output[0][0] > output[0][1] ? 0 : 1;
        setState(() {
          result = predictedIndex == 0 ? 'Cat' : 'Dog'; // Reverse the logic
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      debugPrint('Error during inference: $e');
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff9661A0),
        elevation: 5,
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/image.gif"),
                height: 200,
                width: 200,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discover the World of Cats and Dogs! 🐱🐶",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Gap(5),
                  TextField(
                    controller: urlController,
                    decoration: const InputDecoration(
                      hintText: 'Enter image URL',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    imageUrl = urlController.text;
                  });
                  performAction(urlController.text);
                },
                child: const Text('Predict'),
              ),
              const SizedBox(height: 20),
              if (imageUrl != null)
                Column(
                  children: [
                    Image.network(imageUrl!,
                        height: 200, width: 200, fit: BoxFit.cover),
                    const SizedBox(height: 10),
                    Text(
                      result,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
