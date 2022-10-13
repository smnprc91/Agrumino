class Battery {
  final int? ts;
  final String? value;

  Battery({
    required this.ts,
    required this.value,
  });

  factory Battery.fromJson(Map<String, dynamic> json) {
    return Battery(
      ts: json['ts'],
      value: json['value'],
    );
  }
}
