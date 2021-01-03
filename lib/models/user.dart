class User {
  final String firstname;
  final String surname;
  final String email;
  final String phone;
  final String imageUrl;
  final DateTime dob;
  final String id;
  final bool isMale;
  final bool isAdmin;

  User(this.firstname, this.surname, this.email, this.phone, this.imageUrl,
      this.dob, this.id, this.isMale,{this.isAdmin=false});

  factory User.fromMap() {}
}
