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
