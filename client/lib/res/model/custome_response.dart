
import 'login_response.dart';

class CustomResponse{
  String? message;
  LoginResponse? user;


  CustomResponse({this.message, this.user});

  factory CustomResponse.fromJson(Map<String, dynamic> json) => CustomResponse(
      message: json['message'],
      user: json['user'] != null ? LoginResponse.fromJson(json['user']) : null
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}