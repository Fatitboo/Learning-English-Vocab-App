class LoginResponse {
  int? userId;
  String? username;
  String? avatar;
  String? fullname;
  String? access_token;

  LoginResponse({this.userId, this.username, this.avatar, this.fullname, this.access_token});

  factory LoginResponse.fromJson(Map<String, dynamic> json)=>LoginResponse(
    userId : json['userId'],
    username : json['fullName'],
    avatar : json['avatar'],
    fullname : json['fullname'],
    access_token : json['access_token'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['fullname'] = this.fullname;
    data['access_token'] = this.access_token;
    return data;
  }
}