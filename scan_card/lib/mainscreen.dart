import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:scan_card/result_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final imagePicker = ImagePicker();
  File? _image;

  Future getImagefrom(ImageSource source) async {
    final pick = await imagePicker.pickImage(source: source, imageQuality: 85);

    setState(() {
      _image = File(pick!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Card'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(43, 147, 72, 0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: (_image == null)
                      ? Lottie.network(
                          'https://assets10.lottiefiles.com/private_files/lf30_mtqpupyd.json')
                      : Image.file(_image!, fit: BoxFit.fill),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            getImagefrom(ImageSource.camera);
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            getImagefrom(ImageSource.gallery);
                          },
                          child: const Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      img: _image,
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Text(
                  'Scan Card',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
