class ChatProvider {
  late List<Map<String, dynamic>> _comments;
  static final ChatProvider _instancia = ChatProvider._privado();
  ChatProvider._privado() {
    _comments = [
      // {'nombre': 'Empresa 1', 'description': 'descripcion de la empresa'},
    ];
  }

  factory ChatProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get comments {
    return _comments;
  }

  void addComment(Map<String, dynamic> newcommentary) {
    _comments.add(newcommentary);
  }
}
