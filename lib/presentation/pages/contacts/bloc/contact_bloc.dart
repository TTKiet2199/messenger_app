import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

@injectable
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc(this.firebaseService) : super(const ContactState()) {
    on<ContactEvent>((event, emit) {});
    on<GetListContactEvent>(
        (event, emit) => handleGetListContactEvent(event, emit));
  }
  final FirebaseService? firebaseService;
  handleGetListContactEvent(
      GetListContactEvent event, Emitter<ContactState> emit) async {
    final result = await firebaseService!.getContact();
    final newState = state.coppyWith(listContact: result);
    emit(newState);
  }
}
