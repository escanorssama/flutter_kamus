class Kamus {
  String id;
  String indonesia;
  String english;

  Kamus({this.id, this.indonesia, this.english});

  factory Kamus.fromJson(Map<String, dynamic> json) {
    return Kamus(
      id: json['id'] as String,
      indonesia: json['indonesia'] as String,
      english: json['english'] as String,
    );
  }
}
