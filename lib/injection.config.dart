// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

import 'data/remote/client_remote_repository.dart' as _i323;
import 'data/repositories/client_remote_repo_imp.dart' as _i52;
import 'domain/repositories/client_repository.dart' as _i896;
import 'domain/usecases/create_client_use_case.dart' as _i705;
import 'domain/usecases/delete_client_use_case.dart' as _i994;
import 'domain/usecases/get_client_use_case.dart' as _i179;
import 'domain/usecases/update_client_use_case.dart' as _i175;
import 'injection_module.dart' as _i212;
import 'presentation/state/client_bloc.dart' as _i802;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.lazySingleton<_i519.Client>(() => injectionModule.httpClient);
  gh.lazySingleton<String>(
    () => injectionModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.lazySingleton<_i323.ClientRemoteRepository>(
    () => _i323.ClientRemoteDataImpl(httpClient: gh<_i519.Client>()),
  );
  gh.lazySingleton<_i896.ClientRepository>(
    () => _i52.ClientRemoteRepoImp(
      remoteDataSource: gh<_i323.ClientRemoteRepository>(),
    ),
  );
  gh.factory<_i705.CreateClientUseCase>(
    () => _i705.CreateClientUseCase(gh<_i896.ClientRepository>()),
  );
  gh.factory<_i994.DeleteClientUseCase>(
    () => _i994.DeleteClientUseCase(gh<_i896.ClientRepository>()),
  );
  gh.factory<_i179.GetClientUseCase>(
    () => _i179.GetClientUseCase(gh<_i896.ClientRepository>()),
  );
  gh.factory<_i175.UpdateClientUseCase>(
    () => _i175.UpdateClientUseCase(gh<_i896.ClientRepository>()),
  );
  gh.factory<_i802.ClientBloc>(
    () => _i802.ClientBloc(
      gh<_i179.GetClientUseCase>(),
      gh<_i705.CreateClientUseCase>(),
      gh<_i175.UpdateClientUseCase>(),
      gh<_i994.DeleteClientUseCase>(),
    ),
  );
  return getIt;
}

class _$InjectionModule extends _i212.InjectionModule {}
