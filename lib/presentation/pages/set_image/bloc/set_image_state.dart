part of 'set_image_bloc.dart';

@immutable
class SetImageState {
  final File? image;
  final bool? setImageResult;
  const SetImageState({this.setImageResult, this.image});
  SetImageState coppyWith({
    File? image,
    bool? setImageResult,
  }) =>
      SetImageState(
        image: image ?? this.image,
        setImageResult: setImageResult??this.setImageResult,
      );

}
