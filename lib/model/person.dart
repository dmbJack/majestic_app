class Person {
  final String firstName;
  final String secondName;
  final String? role;
  final String? imageLink;
  Person({
    required this.firstName,
    required this.secondName,
    this.role,
    this.imageLink,
  });

  Person copyWith({
    String? firstName,
    String? secondName,
    String? role,
    String? imageLink,
  }) {
    return Person(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      role: role ?? this.role,
      imageLink: imageLink ?? this.imageLink,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'secondName': secondName});
    if (role != null) {
      result.addAll({'role': role});
    }
    if (imageLink != null) {
      result.addAll({'imageLink': imageLink});
    }

    return result;
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      firstName: map['firstName'] ?? '',
      secondName: map['secondName'] ?? '',
      role: map['role'],
      imageLink: map['imageLink'],
    );
  }

  String getName() {
    return '$firstName $secondName';
  }
}
