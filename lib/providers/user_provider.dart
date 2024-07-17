// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/models/api_result.dart';
import 'package:provider_and_online_data_app/models/user_model.dart';
import 'package:provider_and_online_data_app/services/user_service.dart';

class UserProvider extends ChangeNotifier{
  List<UserModel> users= [];
 bool isLoadingPost = true;


  saveisLoadingPost(bool value){
    isLoadingPost = value;
    notifyListeners();
}

fetchUsers()async{
    List<UserModel> usersTmpList =[];
    ApiResult result = await UserService.fetchUsers();
    saveisLoadingPost(false);
    if(result.success=true){
 List<dynamic> list = jsonDecode(result.response!.body) as List<dynamic>;
   list.forEach((usersData) {
    //print(postsData.toString());
    usersTmpList.add(UserModel.fromMap(usersData));
    });
    }else{
      Text(' Error Occurd while loading users');
    }
  
    // print(postTmpList[20].author_name);
    savedUsers(usersTmpList);
  }
  savedUsers(List<UserModel> value){
    users = value;
  }
}