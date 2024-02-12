import 'dart:developer';

import 'package:editing_software/view/screens/splash_screen/widgets/quill_text_widget.dart';
import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class SmallTextWidget extends StatefulWidget {
  const SmallTextWidget({super.key, required this.index});
  final int index;

  @override
  State<SmallTextWidget> createState() => _SmallTextWidgetState();
}

class _SmallTextWidgetState extends State<SmallTextWidget> {
  late QuillController _controller;

  @override
  void initState() {
    _controller = QuillController.basic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreen, child) {
        return QuillProvider(
          configurations: QuillConfigurations(
            controller: _controller,
            sharedConfigurations: const QuillSharedConfigurations(
              locale: Locale('en'),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: mainScreen.position[widget.index].dx,
                top: mainScreen.position[widget.index].dy,
                child: Draggable(
                  hitTestBehavior: HitTestBehavior.opaque,
                  feedback: Container(
                    padding: const EdgeInsets.all(5),
                    height: 40,
                    width: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                  onDraggableCanceled: (vel, offset) {
                    RenderBox? renderBox =
                        context.findRenderObject() as RenderBox?;

                    if (renderBox != null) {
                      Offset localOffset = renderBox.globalToLocal(offset);

                      mainScreen.updatePosition(widget.index, localOffset);
                    }
                  },
                  child: QuillTextWidget(
                    index: widget.index,
                  ),
                ),
              ),
              if (mainScreen.ifIndexIsActive(widget.index))
                const Align(
                  alignment: Alignment.topCenter,
                  child: QuillToolbar(),
                )
            ],
          ),
        );
      },
    );
  }
}
