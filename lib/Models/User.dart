

class Users{
  String key;
  String name;
  String email;

//<editor-fold desc="Data Methods">

  Users({
    required this.key,
    required this.name,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Users &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          name == other.name &&
          email == other.email);

  @override
  int get hashCode => key.hashCode ^ name.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'Users{' + ' key: $key,' + ' name: $name,' + ' email: $email,' + '}';
  }

  Users copyWith({
    String? key,
    String? name,
    String? email,
  }) {
    return Users(
      key: key ?? this.key,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': this.key,
      'name': this.name,
      'email': this.email,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      key: map['key'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}