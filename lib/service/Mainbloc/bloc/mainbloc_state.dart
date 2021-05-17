part of 'mainbloc_bloc.dart';

@immutable
abstract class MainblocState {}

class MainblocInitial extends MainblocState {}

class AppLoadingState extends MainblocState {}

class AppLoadedState extends MainblocState {
  final userModel? userInfo;
  final pages currentPage;
  AppLoadedState(this.currentPage, this.userInfo);
}
