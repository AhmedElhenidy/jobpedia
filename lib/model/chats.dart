class Chats {
  String id;
  String senderName;
  String receiverName;
  String messages;
  String date;

  Chats({this.date, this.senderName,this.receiverName, this.messages, this.id});
  factory Chats.fromJson(Map<String, dynamic> json) {
    return Chats(
      date: json['date'],
      messages: json['messages'],
      id: json['id'],
      senderName: json['senderName'],
      receiverName: json['receiverName'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['messages'] = this.messages;
    data['id'] = this.id;
    data['senderName'] = this.senderName;
    data['receiverName'] = this.receiverName;
    return data;
  }
}