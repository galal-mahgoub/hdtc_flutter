class Creator {
  Creator({
    String? id,
    String? fullName,
    String? avatar,
  }) {
    _id = id.toString();
    _fullName = fullName;
    _avatar = avatar;
  }

  String? _id;
  String? _fullName;
  String? _avatar;

  String get id => _id ?? '';
  String get fullName => _fullName ?? '';

  String get avatar => _avatar ?? '';
}
