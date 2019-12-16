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
            from: json['from'],
            govern: json['govern'],
            name: json['name'],
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
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['specialize'] = this.specialize;
        data['to'] = this.to;
        data['type'] = this.type;
        return data;
    }
}