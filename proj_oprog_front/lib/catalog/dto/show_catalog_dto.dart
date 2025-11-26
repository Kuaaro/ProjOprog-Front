import 'package:proj_oprog_front/shared/dtos/name_id_pair.dart';

class ShowCatalogDto {
  final List<NameIdPair> catalogs;
  final List<NameIdPair> datasets;

  ShowCatalogDto({required this.catalogs, required this.datasets});

  factory ShowCatalogDto.fromJson(Map<String, dynamic> json) {
    return ShowCatalogDto(
      catalogs: (json['catalogs'] as List<dynamic>)
          .map((e) => NameIdPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      datasets: (json['datasets'] as List<dynamic>)
          .map((e) => NameIdPair.fromJson(e as Map<String, dynamic>))
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
