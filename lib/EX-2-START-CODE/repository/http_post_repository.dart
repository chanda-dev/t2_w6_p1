import 'package:t2_w6_p1/EX-2-START-CODE/model/post.dart';

class HttpPostRepository {
  Future<Post> fromJson(Map<String, dynamic> json) {
    return Future.delayed(Duration(seconds: 5), () {
      return Post(
        id: json['id'],
        title: json['title'],
        description: json['body'],
      );
    });
  }
}
