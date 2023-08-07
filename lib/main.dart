import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(title: "Test App", home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Recognition'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(image: FileImage(imageFile!)),
                  border: Border.all(width: 6, color: Colors.black12),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            else
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 6, color: Colors.black12),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Image should apper here',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => getImage(source: ImageSource.camera),
                    child: const Text(
                      "Capture Image",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => getImage(source: ImageSource.gallery),
                        child: const Text("Select Image",
                            style: TextStyle(fontSize: 18))))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
        // here is my comment
      });
    }
  }
}
