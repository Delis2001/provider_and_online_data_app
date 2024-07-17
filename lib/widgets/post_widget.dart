// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;

  PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 270,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: (post.images!.isEmpty)? Container() :
                Image.network(
                  post.images![0].toString(),
                 height: 180,
                 width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
             post.author_name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                 child:  Text(
                 post.content ?? '',
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
