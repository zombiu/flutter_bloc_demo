import 'dart:async';

import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  ///多么优雅的代码 yield、yield*组合使用 简直像做梦一样
  Stream<AuthenticationStatus> get status async* {
    //延迟5秒之后，发送AuthenticationStatus.unauthenticated到_controller.stream中
    await Future<void>.delayed(const Duration(seconds: 5));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
