

class Requests{
  String senderkey;
  String recieverkey;
  bool isResponded;
  bool isAccepted;
  int timefixed;

//<editor-fold desc="Data Methods">

  Requests({
    required this.senderkey,
    required this.recieverkey,
    required this.isResponded,
    required this.isAccepted,
    required this.timefixed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Requests &&
          runtimeType == other.runtimeType &&
          senderkey == other.senderkey &&
          recieverkey == other.recieverkey &&
          isResponded == other.isResponded &&
          isAccepted == other.isAccepted &&
          timefixed == other.timefixed);

  @override
  int get hashCode =>
      senderkey.hashCode ^
      recieverkey.hashCode ^
      isResponded.hashCode ^
      isAccepted.hashCode ^
      timefixed.hashCode;

  @override
  String toString() {
    return 'Requests{' +
        ' senderkey: $senderkey,' +
        ' recieverkey: $recieverkey,' +
        ' isResponded: $isResponded,' +
        ' isAccepted: $isAccepted,' +
        ' timefixed: $timefixed,' +
        '}';
  }

  Requests copyWith({
    String? senderkey,
    String? recieverkey,
    bool? isResponded,
    bool? isAccepted,
    int? timefixed,
  }) {
    return Requests(
      senderkey: senderkey ?? this.senderkey,
      recieverkey: recieverkey ?? this.recieverkey,
      isResponded: isResponded ?? this.isResponded,
      isAccepted: isAccepted ?? this.isAccepted,
      timefixed: timefixed ?? this.timefixed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderkey': this.senderkey,
      'recieverkey': this.recieverkey,
      'isResponded': this.isResponded,
      'isAccepted': this.isAccepted,
      'timefixed': this.timefixed,
    };
  }

  factory Requests.fromMap(Map<String, dynamic> map) {
    return Requests(
      senderkey: map['senderkey'] as String,
      recieverkey: map['recieverkey'] as String,
      isResponded: map['isResponded'] as bool,
      isAccepted: map['isAccepted'] as bool,
      timefixed: map['timefixed'] as int,
    );
  }

//</editor-fold>
}