// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_online_data_app/datas/post_data.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';
import 'package:provider_and_online_data_app/models/user_model.dart';
import 'package:provider_and_online_data_app/providers/offline_post_provider.dart';

import 'package:provider_and_online_data_app/providers/post_provider.dart';
import 'package:provider_and_online_data_app/providers/user_provider.dart';
import 'package:provider_and_online_data_app/widgets/post_offline_data.dart';
import 'package:provider_and_online_data_app/widgets/post_widget.dart';
import 'package:provider_and_online_data_app/widgets/user_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).fetchPost();
       Provider.of<offlinePostsProvider>(context, listen: false).fetchOfflinePost();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
    });

    
  }

  TextStyle textStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
   // var postDataProvider = context.watch<postOfflineDataProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text('SOCAILIFY'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Today's Post",
                  style: textStyle,
                ),
              ),
              (context.watch<PostProvider>().isLoadingPost)
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: context.watch<PostProvider>().posts.length,
                        itemBuilder: (context, index) {
                          PostModel post =
                              context.watch<PostProvider>().posts[index];
                          return PostWidget(post: post);
                        },
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Explore Users',
                  style: textStyle,
                ),
              ),
              (context.watch<UserProvider>().isLoadingPost)
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: context.watch<UserProvider>().users.length,
                        itemBuilder: (context, index) {
                          UserModel users =
                              context.watch<UserProvider>().users[index];
                          return UserWidget(users: users);
                        },
                      ),
                    ),
              (context.watch<offlinePostsProvider>().isLoadingOfflinePost)
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: context.watch<offlinePostsProvider>().offlinePost.length,
                        itemBuilder: (context, index) {
                          PostModel offlinePost =
                         context.watch<offlinePostsProvider>().offlinePost[index];
                          return PostOfflineDataWidget(offlinePost: offlinePost);
                        },
                      ),
                    ),
            ],
          ),
        ));
  }
}
