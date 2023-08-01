class TalkModel {
  String? id;
  String? name;
  String? image;
  String? messContent;
  IsOnline? isOnline;
  bool? isReed = true;
  int? numMesUnReed = 0;
  String? time;
  bool? seen;
  Inbox? inbox;
  TalkModel(
      {this.id,
      this.name,
      this.image,
      this.isOnline,
      this.isReed,
      this.numMesUnReed,
      this.messContent,
      this.time,
      this.seen,
      this.inbox});
}

enum Inbox { sent, recive }

enum IsOnline { onLine, offLine }
