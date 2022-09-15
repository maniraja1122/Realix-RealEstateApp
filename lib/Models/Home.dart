


class Home{
  String name;
  String userkey;
  String location;
  double Longitude;
  double Latitude;
  int bath;
  int beds;
  int square;
  String description;
  String imglink;

//<editor-fold desc="Data Methods">

  Home({
    required this.name,
    required this.userkey,
    required this.location,
    required this.Longitude,
    required this.Latitude,
    required this.bath,
    required this.beds,
    required this.square,
    required this.description,
    required this.imglink,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Home &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          userkey == other.userkey &&
          location == other.location &&
          Longitude == other.Longitude &&
          Latitude == other.Latitude &&
          bath == other.bath &&
          beds == other.beds &&
          square == other.square &&
          description == other.description &&
          imglink == other.imglink);

  @override
  int get hashCode =>
      name.hashCode ^
      userkey.hashCode ^
      location.hashCode ^
      Longitude.hashCode ^
      Latitude.hashCode ^
      bath.hashCode ^
      beds.hashCode ^
      square.hashCode ^
      description.hashCode ^
      imglink.hashCode;

  @override
  String toString() {
    return 'Home{' +
        ' name: $name,' +
        ' userkey: $userkey,' +
        ' location: $location,' +
        ' Longitude: $Longitude,' +
        ' Latitude: $Latitude,' +
        ' bath: $bath,' +
        ' beds: $beds,' +
        ' square: $square,' +
        ' description: $description,' +
        ' imglink: $imglink,' +
        '}';
  }

  Home copyWith({
    String? name,
    String? userkey,
    String? location,
    double? Longitude,
    double? Latitude,
    int? bath,
    int? beds,
    int? square,
    String? description,
    String? imglink,
  }) {
    return Home(
      name: name ?? this.name,
      userkey: userkey ?? this.userkey,
      location: location ?? this.location,
      Longitude: Longitude ?? this.Longitude,
      Latitude: Latitude ?? this.Latitude,
      bath: bath ?? this.bath,
      beds: beds ?? this.beds,
      square: square ?? this.square,
      description: description ?? this.description,
      imglink: imglink ?? this.imglink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'userkey': this.userkey,
      'location': this.location,
      'Longitude': this.Longitude,
      'Latitude': this.Latitude,
      'bath': this.bath,
      'beds': this.beds,
      'square': this.square,
      'description': this.description,
      'imglink': this.imglink,
    };
  }

  factory Home.fromMap(Map<String, dynamic> map) {
    return Home(
      name: map['name'] as String,
      userkey: map['userkey'] as String,
      location: map['location'] as String,
      Longitude: map['Longitude'] as double,
      Latitude: map['Latitude'] as double,
      bath: map['bath'] as int,
      beds: map['beds'] as int,
      square: map['square'] as int,
      description: map['description'] as String,
      imglink: map['imglink'] as String,
    );
  }

//</editor-fold>
}
