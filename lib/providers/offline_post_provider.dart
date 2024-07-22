// ignore_for_file: avoid_function_literals_in_foreach_calls, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/datas/post_data.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';

class offlinePostsProvider extends ChangeNotifier{
  List<PostModel> offlinePost =[]; 
  bool isLoadingOfflinePost = true;

  void saveisLoadingOfflinePost(bool value){
    isLoadingOfflinePost =value;
  }
  void savedOfflinePost(List<PostModel> value){
    offlinePost = value;
  }

  fetchOfflinePost(){
     List<PostModel> postTmpList =[];
     postDatas.forEach((postDatas) {
    //print(postsData.toString());
    postTmpList.add(PostModel.fromMap(postDatas));
    });
 saveisLoadingOfflinePost(false);
    savedOfflinePost(postTmpList);
  }
}