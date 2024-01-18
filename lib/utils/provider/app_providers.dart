import 'package:editing_software/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => MainScreenNotifier()),
  ];
}
