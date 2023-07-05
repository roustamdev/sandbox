// ignore_for_file: one_member_abstracts

abstract class UseCase<Request, Response> {
  Future<Response> call(Request params);
}

class NoParams {
  NoParams();
}
