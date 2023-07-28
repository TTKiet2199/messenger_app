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

import 'core/services/firebase_service.dart' as _i4;
import 'presentation/pages/creat_name/bloc/create_name_bloc.dart' as _i3;
import 'presentation/pages/login/bloc/login_bloc.dart' as _i5;
import 'presentation/pages/messages/messenger/new_messenger/bloc/new_mess_bloc.dart'
    as _i6;
import 'presentation/pages/set_image/bloc/set_image_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CreateNameBloc>(
        () => _i3.CreateNameBloc(gh<_i4.FirebaseService>()));
    gh.singleton<_i4.FirebaseService>(_i4.FirebaseService());
    gh.factory<_i5.LoginBloc>(() => _i5.LoginBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i6.NewMessengerBloc>(
        () => _i6.NewMessengerBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i7.SetImageBloc>(
        () => _i7.SetImageBloc(gh<_i4.FirebaseService>()));
    return this;
  }
}
