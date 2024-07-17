// ignore_for_file: unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/models/api_result.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';
import 'package:provider_and_online_data_app/services/post_service.dart';

class PostProvider extends ChangeNotifier{
  List<PostModel> posts =[];
   bool isLoadingPost = true;


  saveisLoadingPost(bool value){
    isLoadingPost = value;
    notifyListeners();
}
  fetchPost()async{
    List<PostModel> postTmpList =[];
    ApiResult result = await PostService.fetchPost();
    saveisLoadingPost(false);
    if(result.success=true){
 List<dynamic> list = jsonDecode(result.response!.body) as List<dynamic>;
   list.forEach((postsData) {
    //print(postsData.toString());
    postTmpList.add(PostModel.fromMap(postsData));
    });
    }else{
      Text(' Error Occurd while loading Post');
    }
  
    // print(postTmpList[20].author_name);
    savedPost(postTmpList);
  }
 
  savedPost(List<PostModel> value){ 
    posts = value;
    notifyListeners();
  }
}