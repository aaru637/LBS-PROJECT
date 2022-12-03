class LIBRARIAN
{
  final String firstname;
  final String lastname;
  final String email;
  final String mobile;
  final String aadharno;
  final String librarianid;
  final String gender;
  final String dob;
  final String username;
  final String password;

  const LIBRARIAN({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.aadharno,
    required this.librarianid,
    required this.gender,
    required this.dob,
    required this.username,
    required this.password,
});

  factory LIBRARIAN.fromJson(Map<String, dynamic> json)
  {
    return LIBRARIAN(
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        mobile: json['mobile'],
        aadharno: json['aadharno'],
        librarianid: json['librarianid'],
        gender: json['gender'],
        dob: json['dob'],
        username: json['username'],
        password: json['password']);
  }
}