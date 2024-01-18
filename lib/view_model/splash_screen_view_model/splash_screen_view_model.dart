import 'package:editing_software/data/remote/network/response/api_responses.dart';
import 'package:editing_software/view/screens/splash_screen/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
//
  ApiResponse _apiResponse = ApiResponse.initial();
  ApiResponse get apiResponse => _apiResponse;
  set apiResponse(ApiResponse _) {
    _apiResponse = _;
    notifyListeners();
  }
//

//
  List<SmallTextWidget> _smallWidgets = [];
  List<SmallTextWidget> get smallWidgets => _smallWidgets;
  set smallWidgets(List<SmallTextWidget> _) {
    _smallWidgets = _;
    notifyListeners();
  }

//
//
  List<Offset> _position = [];
  List<Offset> get position => _position;
  set position(List<Offset> _) {
    _position = _;
    notifyListeners();
  }
//

//
  int _activeIndex = -1;
  int get activeIndex => _activeIndex;
  set activeIndex(int _) {
    _activeIndex = _;
    notifyListeners();
  }
//

  void addSmallWidget(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _position.add(Offset(size.width / 4, size.height / 2));
    _smallWidgets.add(SmallTextWidget(
      index: _position.length - 1,
    ));
    notifyListeners();
  }

  void updatePosition(int index, Offset offset) {
    _position[index] = offset;
    notifyListeners();
  }

  bool ifIndexIsActive(int index) {
    if (index == _activeIndex) {
      return true;
    }
    return false;
  }
}
