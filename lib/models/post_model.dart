import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostModel {
  List<dynamic>? images;
  String? author_name;
  String? content;
  PostModel({
    this.images,
    this.author_name,
    this.content,
  });

  PostModel copyWith({
    List<dynamic>? images,
    String? author_name,
    String? content,
  }) {
    return PostModel(
      images: images ?? this.images,
      author_name: author_name ?? this.author_name,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(images != null){
      result.addAll({'images': images});
    }
    if(author_name != null){
      result.addAll({'author_name': author_name});
    }
    if(content != null){
      result.addAll({'content': content});
    }
  
    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      images: List<dynamic>.from(map['images']),
      author_name: map['author_name'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(images: $images, author_name: $author_name, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PostModel &&
      listEquals(other.images, images) &&
      other.author_name == author_name &&
      other.content == content;
  }

  @override
  int get hashCode => images.hashCode ^ author_name.hashCode ^ content.hashCode;
  }
