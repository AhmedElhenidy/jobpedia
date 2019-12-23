class Chats {
  String senderId;
  String receiverId;
  String senderName;
  String receiverName;
  String messages;
  String date;
  String chatId;

  Chats({this.date, this.senderName,this.receiverName, this.messages, this.receiverId,this.senderId,this.chatId});
  factory Chats.fromJson(Map<String, dynamic> json,String chatId) {
    return Chats(
      date: json['date'],
      messages: json['messages'],
      receiverId: json['recieverID'],
      senderId: json['senderID'],
      senderName: json['senderName'],
      receiverName: json['recieverName'],
      chatId: chatId,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['messages'] = this.messages;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['senderName'] = this.senderName;
    data['receiverName'] = this.receiverName;
    return data;
  }
}