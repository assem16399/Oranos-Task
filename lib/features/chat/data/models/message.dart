class Message {
  final String id;
  final String text;
  final bool isMe;

  Message({
    required this.id,
    required this.text,
    required this.isMe,
  });

  Message copyWith({
    String? id,
    String? text,
    bool? isMe,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
    );
  }
}
