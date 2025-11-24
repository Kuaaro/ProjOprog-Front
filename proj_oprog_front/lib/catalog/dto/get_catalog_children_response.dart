class ShowCatalogDto {
  final List<NamedIdPair> catalogs;
  final List<NamedIdPair> datasets;

  ShowCatalogDto({required this.catalogs, required this.datasets});

  factory ShowCatalogDto.fromJson(Map<String, dynamic> json) {
    return ShowCatalogDto(
      catalogs: (json['catalogs'] as List<dynamic>)
          .map((e) => NamedIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasets: (json['datasets'] as List<dynamic>)
          .map((e) => NamedIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'catalogs': catalogs.map((e) => e.toJson()).toList(),
      'datasets': datasets.map((e) => e.toJson()).toList(),
    };
  }
}

class NamedIdPair {
  final String name;
  final int id;

  NamedIdPair({required this.name, required this.id});

  factory NamedIdPair.fromJson(Map<String, dynamic> json) {
    return NamedIdPair(name: json['name'] as String, id: json['id'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id};
  }
}
