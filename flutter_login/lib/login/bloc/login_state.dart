part of 'login_bloc.dart';

class LoginState extends Equatable {
  ///常亮构造函数，默认全都是pure
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  ///继承自 FormzInput，为了方便对输入的内容进行验证
  final Username username;
  final Password password;

  LoginState copyWith({
    FormzStatus status,
    Username username,
    Password password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
