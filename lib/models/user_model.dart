import 'dart:convert';

class UserModel {
     String? profile_pic;
        String? first_name;
           String? last_name;
              String? email;
  UserModel({
    this.profile_pic,
    this.first_name,
    this.last_name,
    this.email,
  });

  UserModel copyWith({
    String? profile_pic,
    String? first_name,
    String? last_name,
    String? email,
  }) {
    return UserModel(
      profile_pic: profile_pic ?? this.profile_pic,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(profile_pic != null){
      result.addAll({'profile_pic': profile_pic});
    }
    if(first_name != null){
      result.addAll({'first_name': first_name});
    }
    if(last_name != null){
      result.addAll({'last_name': last_name});
    }
    if(email != null){
      result.addAll({'email': email});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profile_pic: map['profile_pic'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(profile_pic: $profile_pic, first_name: $first_name, last_name: $last_name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.profile_pic == profile_pic &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.email == email;
  }

  @override
  int get hashCode {
    return profile_pic.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode;
  }
}
