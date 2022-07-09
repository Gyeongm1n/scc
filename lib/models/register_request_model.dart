class RegisterRequestModel {
  RegisterRequestModel({
    required this.username,
    required this.password,
    required this.fitbit,
  });
  late final String username;
  late final String password;
  late final String fitbit;

  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    password = json['password'];
    fitbit = json['fitbit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['fitbit'] = fitbit;
    return _data;
  }
}