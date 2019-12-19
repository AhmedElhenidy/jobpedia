class Notifications {
    String date;
    String from;
    String govern;
    String name;
    String phone;
    String specialize;
    String to;
    int type;

    Notifications({this.date, this.from, this.govern, this.name, this.phone, this.specialize, this.to, this.type});
    factory Notifications.fromJson(Map<String, dynamic> json) {
        return Notifications(
            date: json['date'],
            from: json['senderId'],
            govern: json['govern'],
            name: json['senderName'],
            phone: json['phone'],
            specialize: json['specialize'],
            to: json['to'],
            type: json['type'],
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['from'] = this.from;
        data['govern'] = this.govern;
        data['senderName'] = this.name;
        data['phone'] = this.phone;
        data['specialize'] = this.specialize;
        data['to'] = this.to;
        data['type'] = this.type;
        return data;
    }
}