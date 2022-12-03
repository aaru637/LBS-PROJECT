import 'package:lbs/templates/BOOK.dart';

class BOOKSTUDENT
{
  final String bookname;
  final String authorname;
  final String isbnno;
  final String edition;
  final String publishedyear;
  final String checkdate;
  final String renewdate;

  const BOOKSTUDENT({
    required this.bookname,
    required this.authorname,
    required this.isbnno,
    required this.edition,
    required this.publishedyear,
    required this.checkdate,
    required this.renewdate,
});

  factory BOOKSTUDENT.fromJson(Map<String, dynamic> json) =>
      BOOKSTUDENT(bookname: json['bookname'],
          authorname: json['authorname'],
          isbnno: json['isbnno'],
          edition: json['edition'],
          publishedyear: json['publishedyear'],
          checkdate: json['checkdate'],
          renewdate: json['renewdate']);
}