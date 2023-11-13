class DoctorModel {
  String firstName;
  String speciality;
  String lastName;
  String phoneNumber;

  DoctorModel({
    required this.firstName,
    required this.lastName,
    required this.speciality,
    required this.phoneNumber,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      speciality: json['speciality'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': '+216 $phoneNumber',
        'speciality': speciality,
      };
}
