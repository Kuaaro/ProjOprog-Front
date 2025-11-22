import 'package:flutter/widgets.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_window.dart';

class GlobalDispatcher {
  final VCatalogWindow catalogWindow;
  GlobalDispatcher(this.catalogWindow) {
    showCatalogWindow();
  }
  Widget? _currentView;

  void showCatalogWindow() {
    _currentView = catalogWindow;
  }

  Widget? getCurrentView() => _currentView;
}
