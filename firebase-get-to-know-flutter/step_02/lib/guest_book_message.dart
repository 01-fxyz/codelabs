class GuestBookMessage {
  final String name;
  final String message;
  final List<GuestBookMessage> messages = []; // default value added here

  GuestBookMessage({required this.name, required this.message});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'text': message,
    };
  }
}
