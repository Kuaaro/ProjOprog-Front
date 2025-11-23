import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/metadata_manager/global/iglobal_dispather.dart';
import 'package:proj_oprog_front/metadata_manager/uc/icatalog_uc.dart';
import 'package:proj_oprog_front/metadata_manager/view/catalog/view/vcatalog_window.dart';
import 'package:proj_oprog_front/metadata_manager/view/dataset/vdataset_window.dart';

class GlobalDispatcher extends ChangeNotifier implements IGlobalDispather {
  final VCatalogWindow catalogWindow;
  final VMetadataWindow datasetWindow;

  GlobalDispatcher(this.catalogWindow, this.datasetWindow) {
    showCatalogWindow();
  }

  Widget? _currentView;

  @override
  void showCatalogWindow() {
    _currentView = catalogWindow;
    GetIt.instance<ICatalogUseCase>().showCatalogUC(null);
    notifyListeners();
  }

  @override
  void showMetadataWindow() {
    _currentView = datasetWindow;
    notifyListeners();
  }

  @override
  Widget? getCurrentWindow() => _currentView;
}
