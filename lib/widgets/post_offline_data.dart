// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:provider_and_online_data_app/models/post_model.dart';
import 'package:provider_and_online_data_app/providers/offline_post_provider.dart';

class PostOfflineDataWidget extends StatefulWidget {
  PostModel offlinePost;
 PostOfflineDataWidget({super.key, required this.offlinePost});

  @override
  State<PostOfflineDataWidget> createState() => _PostOfflineDataWidgetState();
}

class _PostOfflineDataWidgetState extends State<PostOfflineDataWidget> {
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
                child: (widget.offlinePost.images!.isEmpty)? Container() :
                Image.network(
                 widget.offlinePost.images![0].toString(),
                 height: 180,
                 width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
             widget.offlinePost.author_name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                 child: (widget.offlinePost.content== null) ? Text(''): Text(
                 widget.offlinePost.content!,
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
