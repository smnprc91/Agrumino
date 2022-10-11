class  Illuminance  {
  final int? ts;
  final String? value;

   Illuminance ({
    required this.ts,
    required this.value,
  });

  factory  Illuminance.fromJson(Map<String, dynamic> json) {
    return Illuminance(
      ts: json['ts'],
      value: json['value'],
    );
  }
}
