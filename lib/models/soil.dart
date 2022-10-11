class Soil {
  final int? ts;
  final String? value;

  Soil({
    required this.ts,
    required this.value,
  });

  factory Soil.fromJson(Map<String, dynamic> json) {
    return Soil(
      ts: json['ts'],
      value: json['value'],
    );
  }
}
