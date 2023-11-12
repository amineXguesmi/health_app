class PatientModel {
  String firstName;
  String email;
  String lastName;
  int age;
  int height;
  String gender;
  int phoneNumber;
  PatientModel({
    required this.firstName,
    required this.lastName,
    required this.height,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.age,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        height: json['height'],
        gender: json['gender'],
        phoneNumber: json['phoneNumber'],
        age: json['age'],
      );
  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'height': height,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'age': age,
      };
}
