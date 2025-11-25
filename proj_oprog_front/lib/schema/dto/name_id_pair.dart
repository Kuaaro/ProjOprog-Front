class NameIdPair {
  final String name;
  final int id;

  NameIdPair({required this.name, required this.id});

  factory NameIdPair.fromJson(Map<String, dynamic> json) {
    return NameIdPair(
      name: json['name'] as String,
      id: json['id'] as int,
    );
  }
}
