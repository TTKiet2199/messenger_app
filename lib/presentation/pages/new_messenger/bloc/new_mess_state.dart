part of 'new_mess_bloc.dart';

@immutable
class NewMessengerState {
  final List<TalkModel>? listTalk;
  final bool? uploadToTalk;
  final String? name;
  final String? image;
  final String? id;

  const NewMessengerState(
      {this.id, this.name, this.image, this.uploadToTalk, this.listTalk});
  NewMessengerState coppyWith(
          {String? id,
          List<TalkModel>? listTalk,
          bool? uploadToTalk,
          String? name,
          String? image}) =>
      NewMessengerState(
        listTalk: listTalk ?? this.listTalk,
        uploadToTalk: uploadToTalk ?? this.uploadToTalk,
        name: name ?? this.name,
        image: image ?? this.image,
        id: id ?? this.id,
      );
}
