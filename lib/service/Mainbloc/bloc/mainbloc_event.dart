part of 'mainbloc_bloc.dart';

@immutable
abstract class MainblocEvent {}

class AppStartEvent extends MainblocEvent {}

class ChangePageEvent extends MainblocEvent {
  final pages newPage;
  ChangePageEvent(this.newPage);
}

class TryloginEvent extends MainblocEvent {
  final String login;
  final String password;
  TryloginEvent(this.login, this.password);
}

class TryRegisterEvent extends MainblocEvent {
  final userModel userInfo;
  TryRegisterEvent(this.userInfo);
}

class ErrorCatchEvent extends MainblocEvent {}

class UpdateUserInfoEvent extends MainblocEvent {
  final userInfoEnum changeParam;
  final String info;
  UpdateUserInfoEvent(this.info, this.changeParam);
}
