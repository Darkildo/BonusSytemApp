import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:loyal_app/enum/page_list.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:loyal_app/service/storage/datastorage.dart';
import 'package:meta/meta.dart';

part 'mainbloc_event.dart';
part 'mainbloc_state.dart';

class MainblocBloc extends Bloc<MainblocEvent, MainblocState> {
  MainblocBloc() : super(MainblocInitial());
  pages _currentPage = pages.login;
  DataStorage? storage;
  @override
  Stream<MainblocState> mapEventToState(
    MainblocEvent event,
  ) async* {
    if (event is AppStartEvent) {
      storage = DataStorage();
      if (storage == null) return;
      await storage!.activateStorage();
      bool authorise = storage!.localStorageAuthorise();
      if (authorise) {
        _currentPage = pages.profile;
        yield AppLoadedState(_currentPage, storage!.loadUserInfo(), true);
      } else {
        _currentPage = pages.login;
        yield AppLoadedState(_currentPage, null, false);
      }
    }

    if (event is ChangePageEvent) {
      _currentPage = event.newPage;
      if (state is AppLoadedState) {
        yield AppLoadedState(_currentPage, (state as AppLoadedState).userInfo,
            (state as AppLoadedState).floatMenuEnabled);
      } else {
        yield state;
      }
    }

    if (event is TryloginEvent) {
      userModel user = storage!.loadUserInfo();
      if (event.login == user.login &&
          event.password == user.password &&
          user.login != 'none') {
        _currentPage = pages.profile;
        yield AppLoadedState(_currentPage, user, true);
      }
    }

    if (event is TryRegisterEvent) {
      await storage!.saveAuthorisedUserInfo(event.userInfo);
      _currentPage = pages.profile;
      yield AppLoadedState(_currentPage, event.userInfo, true);
    }
  }
}
