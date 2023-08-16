import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'select_contact_event.dart';
part 'select_contact_state.dart';

@injectable
class SelectContactBloc extends Bloc<SelectContactEvent, SelectContactState> {
  SelectContactBloc(this.firebaseService) : super(const SelectContactState()) {
    on<SelectContactEvent>((event, emit) {});
    on<GetListCallContactEvent>(
        (event, emit) => handleGetListCallContactEvent(event, emit));
  }
  final FirebaseService? firebaseService;

  handleGetListCallContactEvent(
      GetListCallContactEvent event, Emitter<SelectContactState> emit) async {
    final result = await firebaseService?.getContact();
    final newState = state.coppyWith(listCallContact: result);
    emit(newState);
  }
}
