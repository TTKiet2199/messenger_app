part of 'set_image_bloc.dart';

@immutable
abstract class SetImageEvent {}

class SetImageProfileEvent extends SetImageEvent {
  final File profileImage;

  SetImageProfileEvent({required this.profileImage});
}
class UploadImageEvent extends SetImageEvent{}
