class Messages {
  late String name;
  late String image;
  late String lastMessage;
  late String time;
  late bool isRead;
  late bool isOnline;

  Messages({required this.name, required this.image});
  Messages.Message({required this.name, required this.image, required this.lastMessage, required this.time, required this.isRead, required this.isOnline});
}