class Person {
  final String name;
  final String email;
  final String phone;
  int id = -1;
  Person(this.name, this.email, this.phone);
  Person.id(this.id, this.name, this.email, this.phone);

  Map<String, Object?> toMap() {
    return {'name': name, 'email': email, 'phone': phone};
  }
}
