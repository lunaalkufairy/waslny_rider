class Discount {
  final int id;
  final String code;
  final String percent;
  final String startDate;
  final String endDate;
  final String created;
  final String updated;

  Discount({
    required this.id,
    required this.code,
    required this.percent,
    required this.startDate,
    required this.endDate,
    required this.created,
    required this.updated,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['id'],
      code: json['code'],
      percent: json['percent'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      created: json['dates']['created'],
      updated: json['dates']['updated'],
    );
  }
}
