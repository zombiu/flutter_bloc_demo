part of 'authentication_bloc.dart';

//常量构造函数需以const关键字修饰
// const构造函数必须用于成员变量都是final的类
// 构建常量实例必须使用定义的常量构造函数
// 如果实例化时不加const修饰符，即使调用的是常量构造函数，实例化的对象也不是常量实例
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
