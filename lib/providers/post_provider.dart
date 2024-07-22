// ignore_for_file: unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/datas/post_data.dart';
import 'package:provider_and_online_data_app/models/api_result.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';
import 'package:provider_and_online_data_app/services/post_service.dart';

class PostProvider extends ChangeNotifier{
  List<PostModel> posts =[];
  
   bool isLoadingPost = true;

 savedPost(List<PostModel> value){ 
    posts = value;
    notifyListeners();
  }
 

  saveisLoadingPost(bool value){
    isLoadingPost = value;
    notifyListeners();
}
  fetchPost()async{
   try {
      List<PostModel> postTmpList =[];
    ApiResult result = await PostService.fetchPost();
    saveisLoadingPost(false);
    if(result.success == true){
 List<dynamic> list = jsonDecode(result.response!.body) as List<dynamic>;
   list.forEach((data) {
    //print(postsData.toString());
    postTmpList.add(PostModel.fromMap(data));
    });
    }else{
      print(' Error Occurred while loading Post');
    }
  
    // print(postTmpList[20].author_name);
    savedPost(postTmpList);
   } catch (e) {
    print('Error $e');
   print('An error occurred') ;
   }
  }

  /*fetchOfflinePost(){
     List<PostModel> postTmpList =[];
     postDatas.forEach((data) {
    //print(postsData.toString());
    postTmpList.add(PostModel.fromMap(data));
    });
 saveisLoadingPost(false);
    savedPost(postTmpList);
  }*/

 
}