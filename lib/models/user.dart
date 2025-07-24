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

  User(
    this.firstname, 
    this.surname, 
    this.email, 
    this.phone, 
    this.imageUrl,
    this.dob, 
    this.id, 
    this.isMale, {
    this.isAdmin = false
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['firstname'] ?? '',
      map['surname'] ?? '',
      map['email'] ?? '',
      map['phone'] ?? '',
      map['imageUrl'] ?? '',
      DateTime.tryParse(map['dob'] ?? '') ?? DateTime.now(),
      map['id'] ?? '',
      map['isMale'] ?? false,
      isAdmin: map['isAdmin'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'surname': surname,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
      'dob': dob.toIso8601String(),
      'id': id,
      'isMale': isMale,
      'isAdmin': isAdmin,
    };
  }
}
