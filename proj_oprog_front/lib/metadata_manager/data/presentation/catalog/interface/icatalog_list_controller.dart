abstract class ICatalogListController {
  void onCatalogSelected(int catalogId, String catalogName);
  void onBackPressed();
  void onNewCatalogPressed();
  void loadCatalogChildren(int catalogId);
}
