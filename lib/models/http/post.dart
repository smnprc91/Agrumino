class PostResponse {
  final String token;

  PostResponse({
    required this.token,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      token: json['token'] as String,
    );
  }

  
}
