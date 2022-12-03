import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:lbs/Login_Page.dart';
import 'package:random_string/random_string.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const Register_Page());

class Register_Page extends StatelessWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromRGBO(255, 214, 0, 100),
                    Color.fromRGBO(36, 255, 0, 100)
                  ]),
            ),
          ),
          title: const Text(
            'CS LIBRARY MANAGEMENT SYSTEM',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Cambria',
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
          centerTitle: true,
          toolbarHeight: 70,
        ),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(231, 112, 226, 100.0),
                    Color.fromRGBO(0, 163, 255, 100.0)
                  ]),
            ),
            child: const MYREGISTERFORM(),
          ),
        ),
      ),
    );
  }
}

class MYREGISTERFORM extends StatefulWidget {
  const MYREGISTERFORM({Key? key}) : super(key: key);

  @override
  State<MYREGISTERFORM> createState() => _MYREGISTERFORMState();
}

class _MYREGISTERFORMState extends State<MYREGISTERFORM> {
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool _confirmVisible = true;

  void customLoginToast(String message, BuildContext context) {
    showToast(message,
        textStyle: const TextStyle(
            fontSize: 14,
            wordSpacing: 0.1,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textPadding: EdgeInsets.all(23),
        fullWidth: true,
        toastHorizontalMargin: 25,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.green,
        alignment: Alignment.bottomCenter,
        position: StyledToastPosition.bottom,
        animation: StyledToastAnimation.fade,
        duration: Duration(seconds: 5),
        context: context);
  }

  void customErrorToast(String message, BuildContext context) {
    showToast(message,
        textStyle: const TextStyle(
            fontSize: 14,
            wordSpacing: 0.1,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textPadding: EdgeInsets.all(23),
        fullWidth: true,
        toastHorizontalMargin: 25,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.red,
        alignment: Alignment.bottomCenter,
        position: StyledToastPosition.bottom,
        animation: StyledToastAnimation.fade,
        duration: Duration(seconds: 5),
        context: context);
  }

  void clearText() {
    firstname.clear();
    lastname.clear();
    email.clear();
    mobile.clear();
    aadharno.clear();
    librarianid.clear();
    gender.clear();
    dob.text = '';
    username.clear();
    password.text = '';
    confirmpassword.text = '';
  }

  String value1 = '';

  dynamic dateTime = DateTime(2022);

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController aadharno = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController librarianid = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  Future checkUsername(String user) async {
    var url = "http://localhost/lbs_php/validateLibrarian.php";
    final response = await http.post(Uri.parse(url),
    body: {
      "user" : user,
    });

    value1 = jsonDecode(response.body);

    if (value1 == "true")
    {
      setState(() {
        value1 = 'true';
      });
      return value1.toString();
    }
    else
    {
      setState(() {
        value1 = 'false';
      });
      return value1.toString();
    }
  }

  Icon validIcon() {
    return const Icon(Icons.done_outline_rounded, color: Colors.green,);
  }

  Icon invalidIcon() {
    return const Icon(Icons.cancel, color: Colors.red,);
  }

  Future insertLibrarianData(
      String firstname,
      String lastname,
      String email,
      String mobile,
      String aadharno,
      String gender,
      String dob,
      String librarianId,
      String username,
      String password) async {
    var url = "http://localhost/lbs_php/insertLibrarianData.php";
    final response = await http.post(Uri.parse(url), body: {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobile": mobile,
      "aadharno": aadharno,
      "librarianid": librarianId,
      "gender": gender,
      "dob": dob,
      "username": username,
      "password": password,
    });

    var res = json.decode(response.body);
    if (res == "true") {
      customLoginToast('Registered Successfully...', context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login_Page()));
    } else {
      customErrorToast('You are already Registered....', context);
      clearText();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    mobile.dispose();
    aadharno.dispose();
    gender.dispose();
    dob.dispose();
    librarianid.dispose();
    username.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            // Login Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Flexible(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Cambria',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // First Row
            Row(
              children: [
                // First Name Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: firstname,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    maxLength: 30,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Dhineshkumar",
                        labelText: "First Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your First Name';
                      }
                      return null;
                    },
                  ),
                )),

                // Last Name Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: lastname,
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Dhandapani",
                        labelText: "Last Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Last Name';
                      }
                      return null;
                    },
                  ),
                )),

                // Email Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 35,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "abc@gmail.com",
                        labelText: "Email ID"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                  ),
                )),

                // Mobile No Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: mobile,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    autofocus: true,
                    maxLength: 10,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "1234567890",
                        labelText: "Mobile No"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Mobile No';
                      }
                      return null;
                    },
                  ),
                )),
              ],
            ),

            // Second Row
            Row(
              children: [
                // Aadhar No Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: aadharno,
                    maxLength: 16,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    autofocus: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "123456789101",
                        labelText: "Aadhar No"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Last Name';
                      }
                      return null;
                    },
                  ),
                )),

                // Librarian ID Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: librarianid,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "613520104008",
                        labelText: "Librarian ID"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Librarian ID';
                      }
                      return null;
                    },
                  ),
                )),

                // Gender Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: gender,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Male",
                        labelText: "Gender"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Gender';
                      }
                      return null;
                    },
                  ),
                )),

                // Date of Birth Field
                Flexible(
                    child: SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(80, 22, 20, 40),
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cambria',
                          color: Colors.black87),
                      controller: dob,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black87,
                                width: 10,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_month),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: dateTime,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now());

                              if (newDate != null) {
                                setState(() {
                                  dateTime = newDate;
                                  dob.text =
                                      ("${dateTime.year}-${dateTime.month}-${dateTime.day}");
                                });
                              }
                            },
                          ),
                          hintText: "2002-12-12",
                          labelText: "Date of Birth"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select Your Date of Birth';
                        }
                        return null;
                      },
                    ),
                  ),
                )),
              ],
            ),

            // Third Row
            Row(
              children: [
                // Username Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: username,
                    onChanged: (value) {
                      checkUsername(value);
                    },
                    maxLength: 8,
                    decoration: InputDecoration(
                      suffixIcon: value1 == "true" && value1.isNotEmpty ? validIcon() : invalidIcon(),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "dk12345r",
                        labelText: "Username",),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Username';
                      }
                      return null;
                    },
                  ),
                )),

                // Password Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: password,
                    maxLength: 16,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      return null;
                    },
                  ),
                )),

                // Confirm Password Field
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cambria',
                        color: Colors.black87),
                    controller: confirmpassword,
                    maxLength: 16,
                    obscureText: _confirmVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmVisible = !_confirmVisible;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black87,
                              width: 10,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: "Confirm password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Confirm Password';
                      } else if (password.text != confirmpassword.text) {
                        return "Password and Confirm Password was not same";
                      }
                      return null;
                    },
                  ),
                )),
              ],
            ),

            // Fourth Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Register Button
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: ElevatedButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cambria',
                          letterSpacing: 1.0),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if(value1 == "true" && value1.isNotEmpty)
                          {
                            insertLibrarianData(
                                firstname.text.toUpperCase(),
                                lastname.text.toUpperCase(),
                                email.text.toUpperCase(),
                                mobile.text,
                                aadharno.text,
                                gender.text.toUpperCase(),
                                dob.text,
                                librarianid.text,
                                username.text,
                                password.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login_Page()));
                          }
                        else
                          {
                            customErrorToast('Username is already registered', context);
                          }
                      }
                    },
                  ),
                )),

                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: ElevatedButton(
                          child: const Text(
                            'Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cambria',
                                letterSpacing: 1.0),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login_Page()));
                          }
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
