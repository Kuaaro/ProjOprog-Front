class CatalogDto {
  int id;
  String name;
  String description;
  int parentCatalogId;

  CatalogDto({
    required this.id,
    required this.name,
    required this.description,
    required this.parentCatalogId,
  });
}
