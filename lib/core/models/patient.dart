class PatientModel {
  String firstName;
  String email;
  String lastName;
  int age;
  int height;
  String gender;
  String phoneNumber;
  String password;
  PatientModel({
    required this.firstName,
    required this.lastName,
    required this.height,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.age,
    this.password = '',
  });

  factory PatientModel.fromJson(Map<String, dynamic> json, {String? email}) {
    return PatientModel(
      email: email ?? json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      height: json['height'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      age: json['age'],
    );
  }
  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'height': height,
        'gender': gender,
        'phoneNumber': '+216 $phoneNumber',
        'age': age,
        'password': password,
      };
}
