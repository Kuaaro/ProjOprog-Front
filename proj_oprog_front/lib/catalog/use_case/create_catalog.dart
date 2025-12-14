import 'package:proj_oprog_front/catalog/business_logic/icatalog.dart';
import 'package:proj_oprog_front/catalog/dto/create_catalog_request.dart';
import 'package:proj_oprog_front/catalog/presenter/icreate_catalog_presenter.dart';
import 'package:proj_oprog_front/catalog/use_case/icreate_catalog.dart';
import 'package:proj_oprog_front/catalog/use_case/ishow_catalog.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class CreateCatalog implements ICreateCatalog {
  final ICreateCatalogPresenter createPresenter;
  final ICatalog businessLogic;
  final IShowCatalog showCatalogList;

  CreateCatalog(this.createPresenter, this.businessLogic, this.showCatalogList);

  @override
  void showNewCatalogForm(int parentId) {
    createPresenter.showCreateCatalogForm(parentId);
  }

  @override
  void createCatalog(CreateCatalogRequest req, NamedIdPair? parent) async {
    await businessLogic.createCatalog(req);
    createPresenter.closeCreateCatalogForm();
    showCatalogList.showCatalog(parent);
  }

  @override
  void cancelCreateCatalog() {
    createPresenter.closeCreateCatalogForm();
  }
}
