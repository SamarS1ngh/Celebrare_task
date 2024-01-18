// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class MainEditorScreen extends StatefulWidget {
  const MainEditorScreen({super.key});

  @override
  State<MainEditorScreen> createState() => _MainEditorScreenState();
}

class _MainEditorScreenState extends State<MainEditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        tooltip: "Add Text",
        child: const Icon(Icons.add),
        onPressed: () {
          Provider.of<MainScreenNotifier>(context, listen: false)
              .addSmallWidget(context);
        },
      ),
      body: Column(
        children: [
          const Text(
            "Text Editor",
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: Consumer<MainScreenNotifier>(
              builder: (context, mainScreen, child) => Stack(
                children: List.generate(
                  mainScreen.smallWidgets.length,
                  (index) {
                    return mainScreen.smallWidgets[index];
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
