class ApiConfig {
  ApiConfig._();
  static String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Paths paths = Paths();
}

class Paths {
  //user
  static const getUsers = '/users/';
  static const getAllPosts = '/posts/';
  static const comments = '/comments/';
  static const photos = '/photos/';
  static const albums = '/albums/';
  static String getPostByUserId(String userId) => '/user/$userId/posts';
  static String getAlbumsByUserId(String userId) => '/user/$userId/albums';
  static String getAlbumsWithPhotoByUserId(String userId) =>
      '/user/$userId/albums?_embed=photos';
  static String getPhotoByAlbumId(String albumId) => '/album/$albumId/photos';
  static String getCommentsByPostId(String postId) => '/posts/$postId/comments';
}
