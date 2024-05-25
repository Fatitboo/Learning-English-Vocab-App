class User {
  final int id;
  final String username;
  final String? fullname;
  final String? dob;
  final String email;
  final String? phone;
  final int score;
  final String? avatar;
  final String? googleAccountId;
  final String? passwordResetToken;
  final DateTime? passwordResetExpires;

  User({
    required this.id,
    required this.username,
    this.fullname,
    this.dob,
    required this.email,
    this.phone,
    required this.score,
    this.avatar,
    this.googleAccountId,
    this.passwordResetToken,
    this.passwordResetExpires,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
      dob: json['dob'],
      email: json['email'],
      phone: json['phone'],
      score: json['score'],
      avatar: json['avatar'],
      googleAccountId: json['googleAccountId'],
      passwordResetToken: json['passwordResetToken'],
      passwordResetExpires: json['passwordResetExpires'] != null
          ? DateTime.parse(json['passwordResetExpires'])
          : null,
    );
  }
}
