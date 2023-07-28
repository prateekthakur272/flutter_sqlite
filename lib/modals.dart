class Person {
  final String name;
  final String email;
  final String phone;
  const Person(this.name, this.email, this.phone);

  Map<String, Object?> toMap() {
    return {'name': name, 'email': email, 'phone': phone};
  }
}
