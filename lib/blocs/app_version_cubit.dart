import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionCubit extends Cubit<String?> {
  AppVersionCubit() : super(null);

  void getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(packageInfo.version);
  }
}