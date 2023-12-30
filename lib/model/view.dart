class View {
  final DateTime date;
  bool isView;
  View({
    required this.date,
    this.isView = false,
  });

  View copyWith({
    DateTime? date,
    bool? isView,
  }) {
    return View(
      date: date ?? this.date,
      isView: isView ?? this.isView,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'isView': isView});

    return result;
  }

  factory View.fromMap(Map<String, dynamic> map) {
    return View(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      isView: map['isView'] ?? false,
    );
  }

  void makeIsViewed() {
    isView = true;
  }
}
