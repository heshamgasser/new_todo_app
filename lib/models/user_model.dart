class UserModel {
  static const String COLLECTION_NAME = 'Users';

  String id;
  String firstName;
  String lastName;
  String email;

  UserModel(
      {this.id = '',
      required this.firstName,
      required this.lastName,
      required this.email});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            firstName: json['firstName'],
            lastName: json['lastName'],
            email: json['email']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
