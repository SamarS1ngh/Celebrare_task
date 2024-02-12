import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  Page1({super.key, required this.imagePath});
  String imagePath;
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1>
    with AutomaticKeepAliveClientMixin<Page1> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          tooltip: "Add Text",
          child: const Icon(Icons.add),
          onPressed: () {
            Provider.of<MainScreenNotifier>(context, listen: false)
                .addSmallWidget(context);
          },
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              widget.imagePath,
              height: double.maxFinite,
            ),
          ),
          Column(
            children: [
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
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
