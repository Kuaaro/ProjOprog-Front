import 'package:flutter/widgets.dart';

abstract class IGlobalDispather extends ChangeNotifier {
  void showCatalogWindow();
  void showMetadataWindow();
  Widget? getCurrentWindow();
}
