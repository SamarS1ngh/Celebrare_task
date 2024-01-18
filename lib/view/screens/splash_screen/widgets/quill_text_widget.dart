import 'dart:developer';

import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class QuillTextWidget extends StatefulWidget {
  final int index;
  const QuillTextWidget({super.key, required this.index});

  @override
  State<QuillTextWidget> createState() => _QuillTextWidgetState();
}

class _QuillTextWidgetState extends State<QuillTextWidget> {
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Provider.of<MainScreenNotifier>(context, listen: false).activeIndex =
            widget.index;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: QuillEditor(
        scrollController: ScrollController(),
        focusNode: _focusNode,
        configurations: const QuillEditorConfigurations(
          placeholder: "Enter Text",
          readOnly: false,
        ),
      ),
    );
  }
}
