import 'package:flutter/material.dart';
import 'package:lbs/Staff/View_Staff_Details.dart';
import 'package:lbs/Student/Update_Student.dart';
import 'package:lbs/Student/View_Student_Details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:lbs/templates/STUDENT.dart';
import 'package:lbs/templates/searchWidget.dart';

class View_Student extends StatefulWidget {
  const View_Student({Key? key}) : super(key: key);

  @override
  State<View_Student> createState() => _View_StudentState();
}

class _View_StudentState extends State<View_Student> {
  TextEditingController registerno = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<STUDENT> students = [];
  String query = '';

  void customErrorToast(String message, BuildContext context) {
    showToast(message,
        textStyle: const TextStyle(
            fontSize: 14,
            wordSpacing: 0.1,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textPadding: const EdgeInsets.all(23),
        fullWidth: true,
        toastHorizontalMargin: 25,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.red,
        alignment: Alignment.bottomCenter,
        position: StyledToastPosition.bottom,
        animation: StyledToastAnimation.fade,
        duration: const Duration(seconds: 5),
        context: context);
  }

  void customStudentToast(String message, BuildContext context) {
    showToast(message,
        textStyle: const TextStyle(
            fontSize: 14,
            wordSpacing: 0.1,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textPadding: const EdgeInsets.all(23),
        fullWidth: true,
        toastHorizontalMargin: 25,
        borderRadius: BorderRadius.circular(15),
        backgroundColor: Colors.green,
        alignment: Alignment.bottomCenter,
        position: StyledToastPosition.bottom,
        animation: StyledToastAnimation.fade,
        duration: const Duration(seconds: 5),
        context: context);
  }

  Future<List<STUDENT>> getStudentData(String query) async {
    final url = Uri.parse("http://localhost/lbs_php/getStudentData.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List students = jsonDecode(response.body);
      return students.map((json) => STUDENT.fromJson(json)).where((student) {
        final register = student.registerno.toUpperCase();
        final name = student.firstname.toUpperCase();
        final search = query.toUpperCase();

        return register.contains(search) || name.contains(search);
      }).toList();
    } else {
      throw Exception();
    }
  }

  Future init() async {
    final students = await getStudentData(query);
    setState(() => this.students = students);
  }

  Future deleteStudentData(String registerno1) async {
    var url = "http://localhost/lbs_php/deleteStudentData.php";
    var response =
        await http.post(Uri.parse(url), body: {'registerno': registerno1});
    var data = jsonDecode(response.body);

    if (data == "true") {
      customStudentToast(registerno1 + " Deleted SuccessFully...", context);
    } else {
      customErrorToast(
          'Error Occured While deleting your Record. Please Try again Later...',
          context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Register No or First Name',
        onChanged: searchStudent,
      );

  Future searchStudent(String query) async {
    final students = await getStudentData(query);
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.students = students;
    });
  }

  Widget buildStudent(STUDENT student, index) {
    if (index < students.length) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                  student.firstname.toString().toUpperCase().substring(0, 1)),
            ),
            title: Text(
              student.registerno.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Cambria'),
            ),
            subtitle: Text(
              student.firstname.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Calibri',
                  fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => View_Student_Details(
                            firstname: student.firstname,
                            lastname: student.lastname,
                            email: student.email,
                            mobile: student.mobile,
                            aadharno: student.aadharno,
                            registerno: student.registerno,
                            gender: student.gender,
                            department: student.department,
                            year: student.year,
                            dob: student.dob,
                            username: student.username,
                            password: student.password,
                        bookcount: student.bookcount,
                          )));
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Update_Student(
                                    firstname: student.firstname,
                                    lastname: student.lastname,
                                    email: student.email,
                                    mobile: student.mobile,
                                    aadharno: student.aadharno,
                                    registerno: student.registerno,
                                    gender: student.gender,
                                    department: student.department,
                                    year: student.year,
                                    dob: student.dob,
                                    username: student.username,
                                    password: student.password,
                                    confirmpassword: student.password,
                                bookcount: student.bookcount,
                                  )));
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('AlertDialog Title',),
                            alignment: Alignment.center,
                            content: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'Would you like to Delete ' + student.firstname + ' ?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Confirm'),
                                onPressed: () {
                                  deleteStudentData(student.registerno);
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                child : Container(
                alignment: Alignment.center,
                child: const Text('Student Details',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Cambria',
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ),
              ),

              buildSearch(),

              Expanded(
                child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];

                      return buildStudent(student, index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
