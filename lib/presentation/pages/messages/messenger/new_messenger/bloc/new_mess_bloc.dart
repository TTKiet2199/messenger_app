import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'new_mess_event.dart';
part 'new_mess_state.dart';

@injectable
class NewMessengerBloc extends Bloc<NewMessEvent, NewMessengerState> {
  NewMessengerBloc(this.firebaseService) : super(NewMessengerState()) {
    on<NewMessEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserEvent>((event, emit) => handleGetUserEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleGetUserEvent(GetUserEvent event, Emitter<NewMessengerState> emit) {
    final result = firebaseService!.getUser();
  }
}
