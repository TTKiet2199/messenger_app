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
import 'presentation/pages/calls/select_contact/bloc/select_contact_bloc.dart'
    as _i13;
import 'presentation/pages/chat/bloc/chat_bloc.dart' as _i3;
import 'presentation/pages/contacts/bloc/contact_bloc.dart' as _i5;
import 'presentation/pages/creat_name/bloc/create_name_bloc.dart' as _i6;
import 'presentation/pages/enter_phone_numb/bloc/enter_phone_number_bloc.dart'
    as _i7;
import 'presentation/pages/group/bloc/new_group_bloc.dart' as _i10;
import 'presentation/pages/login/bloc/login_bloc.dart' as _i8;
import 'presentation/pages/messages/messenger/bloc/messages_bloc.dart' as _i9;
import 'presentation/pages/new_messenger/bloc/new_mess_bloc.dart' as _i11;
import 'presentation/pages/profile/bloc/profile_bloc.dart' as _i12;
import 'presentation/pages/set_image/bloc/set_image_bloc.dart' as _i14;

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
    gh.factory<_i3.ChatBloc>(() => _i3.ChatBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i5.ContactBloc>(
        () => _i5.ContactBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i6.CreateNameBloc>(
        () => _i6.CreateNameBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i7.EnterPhoneNumberBloc>(
        () => _i7.EnterPhoneNumberBloc(gh<_i4.FirebaseService>()));
    gh.singleton<_i4.FirebaseService>(_i4.FirebaseService());
    gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i9.MessagesBloc>(
        () => _i9.MessagesBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i10.NewGroupBloc>(
        () => _i10.NewGroupBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i11.NewMessengerBloc>(
        () => _i11.NewMessengerBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i12.ProfileBloc>(
        () => _i12.ProfileBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i13.SelectContactBloc>(
        () => _i13.SelectContactBloc(gh<_i4.FirebaseService>()));
    gh.factory<_i14.SetImageBloc>(
        () => _i14.SetImageBloc(gh<_i4.FirebaseService>()));
    return this;
  }
}
