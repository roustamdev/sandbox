import 'package:dio/dio.dart';
import 'package:eds_test/data/datasources/remote/album_remote_source.dart';
import 'package:eds_test/data/datasources/remote/post_remote_source.dart';
import 'package:eds_test/data/datasources/remote/user_remote_source.dart';
import 'package:eds_test/data/repositories/album_repo_impl.dart';
import 'package:eds_test/data/repositories/post_repo_impl.dart';
import 'package:eds_test/data/repositories/user_repo_impl.dart';
import 'package:eds_test/domain/repositories/album_repository.dart';
import 'package:eds_test/domain/repositories/post_repository.dart';
import 'package:eds_test/domain/repositories/user_repository.dart';
import 'package:eds_test/domain/usecases/album/fetch_user_alboms.dart';
import 'package:eds_test/domain/usecases/post/fetch_post_comments.dart';
import 'package:eds_test/domain/usecases/post/fetch_user_posts.dart';
import 'package:eds_test/domain/usecases/post/send_comment_usecase.dart';
import 'package:eds_test/domain/usecases/user/fetch_user.dart';
import 'package:eds_test/domain/usecases/user/fetch_users.dart';
import 'package:eds_test/shared/services/network_tool/dio.dart';
import 'package:eds_test/shared/services/network_tool/network_interface.dart';
import 'package:get_it/get_it.dart';

GetIt injection = GetIt.instance;

Future<void> setUpDI() async {
  injection
    //<<<<< network tool >>>>>
    ..registerSingleton(Dio())
    ..registerSingleton<NetworkToolInterface>(DioNetworkTool())
    //<<<<< datasources >>>>>
    ..registerSingleton<UserDatasource>(UserRemoteSource())
    ..registerSingleton<PostRemotesource>(PostRemoteSourceImpl())
    ..registerSingleton<AlbumRemotesource>(AlbumRemoteSourceImpl())
    //<<<<< repositories >>>>>
    ..registerSingleton<UserRepository>(UserRepoImpl())
    ..registerSingleton<PostRepository>(PostRepoImpl())
    ..registerSingleton<AlbumRepository>(AlbumRepoImpl())
    //<<<<<< usecases >>>>>
    ..registerSingleton(FetchAlbumsByUserIdWithPhotosUseCase())
    ..registerSingleton(FetchPostCommentsUseCase())
    ..registerSingleton(FetchUser())
    ..registerSingleton(FetchUsers())
    ..registerSingleton(SendCommentUseCase())
    ..registerSingleton(FetchUserPostsUseCase());
}
