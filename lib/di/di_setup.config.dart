// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_arch/features/auth/data/repository/auth_repo_impl.dart'
    as _i11;
import 'package:clean_arch/features/auth/data/service/auth_service.dart' as _i8;
import 'package:clean_arch/features/auth/domain/repository/auth_repo.dart'
    as _i10;
import 'package:clean_arch/features/auth/presentation/bloc/auth_bloc.dart'
    as _i12;
import 'package:clean_arch/features/product/data/repository/get_product_impl.dart'
    as _i6;
import 'package:clean_arch/features/product/data/service/product_services.dart'
    as _i4;
import 'package:clean_arch/features/product/domain/repository/get_product_repo.dart'
    as _i5;
import 'package:clean_arch/features/product/presentation/bloc/get_product_bloc.dart'
    as _i9;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'app_module.dart' as _i13;
import 'shared_pref.dart' as _i14;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(appModule.dio);
  gh.factory<_i4.GetProduct>(() => _i4.GetProduct(gh<_i3.Dio>()));
  gh.factory<_i5.GetProductRepo>(
      () => _i6.GetProductRepoImpl(gh<_i4.GetProduct>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i8.AuthService>(() => _i8.AuthService(gh<_i3.Dio>()));
  gh.factory<_i9.GetProductBloc>(
      () => _i9.GetProductBloc(gh<_i5.GetProductRepo>()));
  gh.factory<_i10.AuthRepo>(() => _i11.AuthRepoImpl(gh<_i8.AuthService>()));
  gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(gh<_i10.AuthRepo>()));
  return getIt;
}

class _$AppModule extends _i13.AppModule {}

class _$RegisterModule extends _i14.RegisterModule {}
