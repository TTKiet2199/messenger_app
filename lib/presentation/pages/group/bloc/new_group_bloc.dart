import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_app/core/services/firebase_service.dart';
import 'package:messenger_app/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'new_group_event.dart';
part 'new_group_state.dart';

@injectable
class NewGroupBloc extends Bloc<NewGroupEvent, NewGroupState> {
  NewGroupBloc(this.firebaseService) : super(const NewGroupState()) {
    on<NewGroupEvent>((event, emit) {});
    on<GetMemberListEvent>(
        (event, emit) => handleGetMemberListEvent(event, emit));
  }
  final FirebaseService? firebaseService;

  handleGetMemberListEvent(
      GetMemberListEvent event, Emitter<NewGroupState> emit) async {
    final result = await firebaseService!.getContact();
    final newState = state.coppyWith(listMember: result);
    emit(newState);
  }
}
