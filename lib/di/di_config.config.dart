// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i28;
import '../module_auth/authoriazation_module.dart' as _i27;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i14;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i12;
import '../module_auth/service/auth_service/auth_service.dart' as _i15;
import '../module_auth/state_manager/forget_state_manager/forget_password_state_manager.dart'
    as _i16;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i18;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i19;
import '../module_auth/state_manager/reset_state_manager/reset_password_state_manager.dart'
    as _i20;
import '../module_auth/ui/screen/forget_password_screen/forget_password_screen.dart'
    as _i22;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i23;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i24;
import '../module_auth/ui/screen/reset_password_screen/reset_password_screen.dart'
    as _i25;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_network/http_client/http_client.dart' as _i10;
import '../module_splash/splash_module.dart' as _i26;
import '../module_splash/ui/screen/splash_screen.dart' as _i21;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i8;
import '../module_theme/service/theme_service/theme_service.dart' as _i11;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i13;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i9;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i17;
import '../utils/global/global_state_manager.dart' as _i4;
import '../utils/logger/logger.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.singleton<_i4.GlobalStateManager>(_i4.GlobalStateManager());
  gh.factory<_i5.LocalizationPreferencesHelper>(
      () => _i5.LocalizationPreferencesHelper());
  gh.factory<_i6.LocalizationService>(
      () => _i6.LocalizationService(gh<_i5.LocalizationPreferencesHelper>()));
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.ThemePreferencesHelper>(() => _i8.ThemePreferencesHelper());
  gh.factory<_i9.UploadRepository>(() => _i9.UploadRepository());
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(gh<_i7.Logger>()));
  gh.factory<_i11.AppThemeDataService>(
      () => _i11.AppThemeDataService(gh<_i8.ThemePreferencesHelper>()));
  gh.factory<_i12.AuthRepository>(() => _i12.AuthRepository(
        gh<_i10.ApiClient>(),
        gh<_i7.Logger>(),
      ));
  gh.factory<_i13.UploadManager>(
      () => _i13.UploadManager(gh<_i9.UploadRepository>()));
  gh.factory<_i14.AuthManager>(
      () => _i14.AuthManager(gh<_i12.AuthRepository>()));
  gh.factory<_i15.AuthService>(() => _i15.AuthService(
        gh<_i3.AuthPrefsHelper>(),
        gh<_i14.AuthManager>(),
      ));
  gh.factory<_i16.ForgotPassStateManager>(
      () => _i16.ForgotPassStateManager(gh<_i15.AuthService>()));
  gh.factory<_i17.ImageUploadService>(
      () => _i17.ImageUploadService(gh<_i13.UploadManager>()));
  gh.factory<_i18.LoginStateManager>(
      () => _i18.LoginStateManager(gh<_i15.AuthService>()));
  gh.factory<_i19.RegisterStateManager>(
      () => _i19.RegisterStateManager(gh<_i15.AuthService>()));
  gh.factory<_i20.ResetPasswordStateManager>(
      () => _i20.ResetPasswordStateManager(gh<_i15.AuthService>()));
  gh.factory<_i21.SplashScreen>(
      () => _i21.SplashScreen(gh<_i15.AuthService>()));
  gh.factory<_i22.ForgotPassScreen>(
      () => _i22.ForgotPassScreen(gh<_i16.ForgotPassStateManager>()));
  gh.factory<_i23.LoginScreen>(
      () => _i23.LoginScreen(gh<_i18.LoginStateManager>()));
  gh.factory<_i24.RegisterScreen>(
      () => _i24.RegisterScreen(gh<_i19.RegisterStateManager>()));
  gh.factory<_i25.ResetPasswordScreen>(
      () => _i25.ResetPasswordScreen(gh<_i20.ResetPasswordStateManager>()));
  gh.factory<_i26.SplashModule>(
      () => _i26.SplashModule(gh<_i21.SplashScreen>()));
  gh.factory<_i27.AuthorizationModule>(() => _i27.AuthorizationModule(
        gh<_i23.LoginScreen>(),
        gh<_i24.RegisterScreen>(),
        gh<_i25.ResetPasswordScreen>(),
        gh<_i22.ForgotPassScreen>(),
      ));
  gh.factory<_i28.MyApp>(() => _i28.MyApp(
        gh<_i26.SplashModule>(),
        gh<_i27.AuthorizationModule>(),
      ));
  return getIt;
}
