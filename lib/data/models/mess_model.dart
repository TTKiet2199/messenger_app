class MessObject {
  String? name;
  String? image;
  String? messContent;
  IsOnline? isOnline;
  bool? isReed = true;
  int? numMesUnReed = 0;
  String? time;
  bool? seen;
  Inbox? inbox;
  MessObject(
      {required this.name,
      required this.image,
      required this.isOnline,
      this.isReed,
      this.numMesUnReed,
      required this.messContent,
      required this.time,
      this.seen,
      required this.inbox});
}

enum Inbox { sent, recive }

enum IsOnline { onLine, offLine }
