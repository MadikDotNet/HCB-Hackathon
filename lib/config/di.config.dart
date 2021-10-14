// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/blocs/auth_bloc.dart' as _i6;
import '../auth/data/auth_repository.dart' as _i7;
import '../auth/data/providers/auth_api.dart' as _i3;
import '../auth/data/providers/in_memory_token_storage.dart' as _i13;
import '../auth/data/providers/secure_token_storage.dart' as _i12;
import '../auth/data/providers/token_storage.dart' as _i11;
import '../auth/log_in/blocs/log_in_bloc.dart' as _i8;
import '../common/api/api_client.dart' as _i9;
import '../common/api/index.dart' as _i4;
import '../home/blocs/bottom_navigation_bloc.dart' as _i5;
import 'register_module.dart' as _i14;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AuthApi>(() => _i3.AuthApi(client: get<_i4.ApiClient>()));
  gh.factory<_i5.BottomNavigationBloc>(() => _i5.BottomNavigationBloc());
  gh.factory<_i6.AuthBloc>(
      () => _i6.AuthBloc(repository: get<_i7.AuthRepository>()));
  gh.factory<_i8.LogInBloc>(() => _i8.LogInBloc(
      authBloc: get<_i6.AuthBloc>(),
      authenticationRepository: get<_i7.AuthRepository>()));
  gh.singleton<_i9.ApiClient>(_i9.ApiClient(), dispose: (i) => i.close());
  gh.singleton<_i10.FlutterSecureStorage>(registerModule.storage);
  gh.singleton<_i11.TokenStorage>(
      _i12.SecureTokenStorage(storage: get<_i10.FlutterSecureStorage>()),
      registerFor: {_prod});
  gh.singleton<_i11.TokenStorage>(_i13.InMemoryTokenStorage(),
      registerFor: {_dev, _test});
  gh.singleton<_i7.AuthRepository>(_i7.AuthRepository(
      client: get<_i3.AuthApi>(),
      storage: get<_i11.TokenStorage>(),
      api: get<_i9.ApiClient>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {
  @override
  _i10.FlutterSecureStorage get storage => _i10.FlutterSecureStorage();
}
