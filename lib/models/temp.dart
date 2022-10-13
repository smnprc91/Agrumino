class Temperature {
  final int ts;
  final String value;

  Temperature({
    required this.ts,
    required this.value,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      ts: json['ts'],
      value: json['value'],
    );
  }
}
