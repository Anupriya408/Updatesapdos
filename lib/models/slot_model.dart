class Slot {
  final String? id;
  final String? startTime;
  final String? endTime;

  Slot({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );
  }
}
