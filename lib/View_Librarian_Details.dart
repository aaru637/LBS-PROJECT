import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class View_Librarian_Details extends StatefulWidget {
  final String username ;
  final String password ;
  const View_Librarian_Details({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  State<View_Librarian_Details> createState() => _View_Librarian_DetailsState();
}

class _View_Librarian_DetailsState extends State<View_Librarian_Details> {
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool _confirmVisible = true;
  dynamic genderChoice;
  List genders = ["Male", "Female", "Others"];

  dynamic dateTime = DateTime(2022);

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController aadharno = TextEditingController();
  TextEditingController librarianId = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  Future searchData(String username, String password) async
  {
    var url = "http://192.168.43.62/lbs_php/search_username.php";
    final response = await http.post(Uri.parse(url),
        body: {"username" : username, "password" : password,});
    var dataReceived = jsonDecode(response.body);
    print(dataReceived);
    print('In Librarian Page');
  }

  @override
  void initState() {
    // TODO: implement initState
    searchData(widget.username, widget.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.blue, Colors.redAccent]),
          ),
        ),
        title: const Text(
          'CS LIBRARY MANAGEMENT SYSTEM',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Cambria',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(231, 112, 226, 100.0),
                Color.fromRGBO(0, 163, 255, 100.0)
              ]),
        ),
        child: Form(
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
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          'Librarian Details',
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Cambria',
                              fontWeight: FontWeight.bold),
                        ),
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
                    // Register No Field
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 40, 0, 40),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cambria',
                                color: Colors.black87),
                            controller: librarianId,
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
                                labelText: "Register No"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Register No';
                              }
                              return null;
                            },
                          ),
                        )),

                    // Gender Field
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(120, 22, 1, 40),
                          child: SizedBox(
                            width: 350,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black87)),
                              child: DropdownButton(
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cambria',
                                    color: Colors.black87),
                                underline: const SizedBox(),
                                hint: const Text('Select Gender'),
                                value: genderChoice,
                                onChanged: (newvalue) {
                                  setState(() {
                                    genderChoice = newvalue;
                                  });
                                },
                                items: genders.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        )),

                    // Date of Birth Field
                    Flexible(
                        child: SizedBox(
                          width: 400,
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
                                          ("${dateTime.day}/${dateTime.month}/${dateTime.year}");
                                        });
                                      }
                                    },
                                  ),
                                  hintText: "12/12/2002",
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            maxLength: 8,
                            readOnly: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black87,
                                      width: 10,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                hintText: "dk12345r",
                                labelText: "Username"),
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
                              'UPDATE Librarian',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cambria',
                                  letterSpacing: 1.0),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                username.clear();
                                password.clear();
                              }
                            },
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
