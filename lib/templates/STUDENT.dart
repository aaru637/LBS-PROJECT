
class STUDENT {
  final String firstname;
  final String lastname;
  final String email;
  final String mobile;
  final String aadharno;
  final String registerno;
  final String gender;
  final String department;
  final String year;
  final String dob;
  final String username;
  final String password;
  final String bookcount;

  const STUDENT({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.aadharno,
    required this.registerno,
    required this.gender,
    required this.department,
    required this.year,
    required this.dob,
    required this.username,
    required this.password,
    required this.bookcount,
  });

  factory STUDENT.fromJson(Map<String, dynamic> json) => STUDENT(
    firstname: json['firstname'],
    lastname: json['lastname'],
    email: json['email'],
    mobile: json['mobile'],
    aadharno: json['aadharno'],
    registerno: json['registerno'],
    gender: json['gender'],
    department: json['department'],
    year: json['year'],
    dob: json['dob'],
    username: json['username'],
    password: json['password'],
    bookcount: json['bookcount'],
  );
}
