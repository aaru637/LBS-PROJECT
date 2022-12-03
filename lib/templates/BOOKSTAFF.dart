import 'package:lbs/templates/BOOK.dart';

class BOOKSTAFF
{
  final String bookname;
  final String authorname;
  final String isbnno;
  final String edition;
  final String publishedyear;
  final String checkdate;
  final String renewdate;

  const BOOKSTAFF({
    required this.bookname,
    required this.authorname,
    required this.isbnno,
    required this.edition,
    required this.publishedyear,
    required this.checkdate,
    required this.renewdate,
  });

  factory BOOKSTAFF.fromJson(Map<String, dynamic> json) =>
      BOOKSTAFF(bookname: json['bookname'],
          authorname: json['authorname'],
          isbnno: json['isbnno'],
          edition: json['edition'],
          publishedyear: json['publishedyear'],
          checkdate: json['checkdate'],
          renewdate: json['renewdate']);
}