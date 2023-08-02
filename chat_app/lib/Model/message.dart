class Message {
  final String from;
  final String to;
  final String text;
  final DateTime date;
  final bool isRead;
  final Message? reply;

  const Message({
    required this.from,
    required this.to,
    required this.text,
    required this.date,
    this.isRead = false,
    this.reply,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      from: json['from'],
      to: json['to'],
      text: json['text'],
      date: DateTime.parse(json['date']),
      reply: json['reply'] != null ? Message.fromJson(json['reply']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "to": to,
      "text": text,
      "date": date.toString(),
      "reply": reply?.toJson(),
    };
  }

  Message copyWith({
    String? text,
    bool? isRead,
  }) =>
      Message(
        from: from,
        to: to,
        text: text ?? this.text,
        date: date,
        isRead: isRead ?? this.isRead,
      );
}
