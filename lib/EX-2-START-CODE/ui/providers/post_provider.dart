import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:t2_w6_p1/EX-2-START-CODE/dto/post_dto.dart';
import 'package:t2_w6_p1/EX-2-START-CODE/repository/http_post_repository.dart';

import '../../model/post.dart';
import '../../repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  //final PostRepository _repository;
  final HttpPostRepository _httpPostRepository;
  AsyncValue<Post>? postValue;

  // PostProvider({required PostRepository repository}) : _repository = repository;
  PostProvider({required HttpPostRepository httpPostRepo})
    : _httpPostRepository = httpPostRepo;
  void fetchPost(Uri url) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      // List<Post> post = await _repository.getPost(postId);
      final postDto = PostDto(link: url);
      final response = await postDto.getHttp();
      final json = jsonDecode(response);
      Map<String, dynamic> jsonData = json[0];

      Post post = await _httpPostRepository.fromJson(jsonData);
      // if (post.isEmpty) {
      //   postValue = AsyncValue.empty();
      // } else {
      //   // 3  Set success state
      //   postValue = AsyncValue.success(post);
      // }
      postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
