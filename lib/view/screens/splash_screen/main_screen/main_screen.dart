import 'package:editing_software/view/screens/splash_screen/main_screen/page1.dart';
import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainEditorScreen extends StatefulWidget {
  const MainEditorScreen({super.key});

  @override
  State<MainEditorScreen> createState() => _MainEditorScreenState();
}

class _MainEditorScreenState extends State<MainEditorScreen> {
  List<String> imgPth = [
    'assets/temp1.jpg',
    'assets/temp2.jpg',
    'assets/temp3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Editor'),
          backgroundColor: Colors.yellow,
        ),
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
                create: (context) => MainScreenNotifier(),
                child: Page1(imagePath: imgPth[index]));
          },
        ),
      ),
    );
  }
}
