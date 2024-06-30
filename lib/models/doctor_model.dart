class Doctor {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
