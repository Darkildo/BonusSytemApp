// ignore: file_names
// ignore: file_names
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loyal_app/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

class DataStorage {
  static final DataStorage _singleInstance = DataStorage._internal();

  // ignore: prefer_typing_uninitialized_variables
  var box;
  factory DataStorage() {
    return _singleInstance;
  }

  DataStorage._internal();

  Future<void> activateStorage() async {
    if (box == null) await Hive.initFlutter();

    box = await Hive.openBox('somebox');

    return;
  }

  Future<void> deleteLocalUser() async {
    return await Hive.deleteBoxFromDisk('somebox');
  }

  Future<String> getApplicationDirectory() async {
    final result = await getApplicationDocumentsDirectory();
    return result.path;
  }

  //* возвращает значения первичного запуска приложения
  userModel loadUserInfo() {
    return userModel(
      box.get('firstName') ?? 'none',
      box.get('lastName') ?? 'none',
      box.get('login') ?? 'none',
      box.get('mobileNumber') ?? 'none',
      box.get('thirdName') ?? 'none',
      box.get('password') ?? 'none',
    );
  }

  //* возвращает значения, локальной авторизации пользователя
  bool localStorageAuthorise() {
    var res = box.get('Authorised');
    if (res != null) return res;
    return false;
  }

  Future<void> saveAuthorisedUserInfo(userModel user) async {
    await box.put('login', user.login);
    await box.put('password', user.password);
    await box.put('firstName', user.firstName);
    await box.put('lastName', user.lastName);
    await box.put('mobileNumber', user.mobileNumber);
    await box.put('thirdName', user.thirdName);
    await setValuelocalStorageAuthorise(true);
    return;
  }

  Future<void> setValuelocalStorageAuthorise(bool val) async {
    return await box.put('Authorised', val);
  }

  Future<void> updateUserInfo(userModel user) async {
    if (user.firstName.isNotEmpty) await box.put('firstName', user.firstName);
    if (user.lastName.isNotEmpty) await box.put('lastName', user.lastName);
    if (user.login.isNotEmpty) await box.put('login', user.login);
    if (user.mobileNumber.isNotEmpty)
      await box.put('mobileNumber', user.mobileNumber);
    if (user.thirdName.isNotEmpty) await box.put('thirdName', user.thirdName);
  }
}
