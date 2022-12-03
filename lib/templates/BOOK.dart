

class BOOK {
  final String booktitle;
  final String authorname;
  final String email;
  final String phoneno;
  final String edition;
  final String publishedyear;
  final String isbnno;
  final String publication;
  final String count;

  const BOOK({
    required this.booktitle,
    required this.authorname,
    required this.email,
    required this.phoneno,
    required this.edition,
    required this.publishedyear,
    required this.isbnno,
    required this.publication,
    required this.count,
  });
  factory BOOK.fromJson(Map<String, dynamic> json) => BOOK(
    booktitle: json['booktitle'],
    authorname: json['authorname'],
    email: json['email'],
    phoneno: json['phoneno'],
    edition: json['edition'],
    publishedyear: json['publishedyear'],
    isbnno: json['isbnno'],
    publication: json['publication'],
    count: json['count'],
  );
}
