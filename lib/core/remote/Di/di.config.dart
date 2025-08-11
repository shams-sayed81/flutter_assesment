// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/product%20list/data/data_sources/impl/products_data_source_impl.dart'
    as _i592;
import '../../../features/product%20list/data/data_sources/products_data_source.dart'
    as _i969;
import '../../../features/product%20list/data/repositories/products_repo.dart'
    as _i430;
import '../../../features/product%20list/domain/repositories/products_repo_impl.dart'
    as _i362;
import '../../../features/product%20list/domain/use_cases/products_use_case.dart'
    as _i585;
import '../../../features/product%20list/presentation/manager/products_view_model_cubit.dart'
    as _i948;
import '../api_manager.dart' as _i1069;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1069.ApiManager>(() => _i1069.ApiManager());
    gh.factory<_i969.ProductsDataSource>(
      () => _i592.ProductsDataSourceImpl(gh<_i1069.ApiManager>()),
    );
    gh.factory<_i430.ProductsRepo>(
      () => _i362.ProductsRepoImpl(gh<_i969.ProductsDataSource>()),
    );
    gh.factory<_i585.ProductsUseCase>(
      () => _i585.ProductsUseCase(gh<_i430.ProductsRepo>()),
    );
    gh.factory<_i948.ProductsViewModelCubit>(
      () => _i948.ProductsViewModelCubit(gh<_i585.ProductsUseCase>()),
    );
    return this;
  }
}
