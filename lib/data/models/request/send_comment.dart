import 'package:eds_test/domain/entities/request/comment_params.dart';

class SendCommentRequestModel extends SendCommentParams {
  SendCommentRequestModel({
    required super.name,
    required super.email,
    required super.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory SendCommentRequestModel.fromDomain(SendCommentParams entity) {
    return SendCommentRequestModel(
      email: entity.email,
      body: entity.body,
      name: entity.name,
    );
  }
}
