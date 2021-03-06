import 'dart:async';

import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
///Web API --> Api Provider --> Repository --> BLoC --> Widget
///基本上，存储库是对数据来自何处的抽象化，无论数据来自磁盘缓存，云还是其他来源。工厂将根据每个来源的可用性来决定使用哪个来源。
///调用者只需要经过一个门。因为上面的教程只有一个来源（API /云），所以对我而言这似乎毫无用处。
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  ///多么优雅的代码 yield、yield*组合使用 简直像做梦一样
  Stream<AuthenticationStatus> get status async* {
    //延迟3秒之后，发送AuthenticationStatus.unauthenticated到_controller.stream中
    await Future<void>.delayed(const Duration(seconds: 3));
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
