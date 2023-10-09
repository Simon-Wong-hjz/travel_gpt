class TravelInfo {
  String? location;
  String? createTime;
  String? goTime;
  String? backTime;
  int? people;
  int? money;
  List<String>? keys;
  TravelDestination? travelDestination;

  TravelInfo({
    this.location,
    this.createTime,
    this.goTime,
    this.backTime,
    this.people,
    this.money,
    this.keys,
    this.travelDestination,
  });

  factory TravelInfo.fromJson(Map<String, dynamic> json) {
    return TravelInfo(
      location: json['location'],
      createTime: json['createTime'],
      goTime: json['goTime'],
      backTime: json['backTime'],
      people: json['people'],
      money: json['money'],
      keys: json['keys'] != null ? List<String>.from(json['keys']) : null,
      travelDestination: json['travelDestination'] != null
          ? TravelDestination.fromJson(json['travelDestination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'location': location,
    'createTime': createTime,
    'goTime': goTime,
    'backTime': backTime,
    'people': people,
    'money': money,
    'keys': keys,
    'travelDestination': travelDestination?.toJson(),
  };

}

class TravelDestination {
  String destination;
  String destinationDescription;
  List<TravelDay> dayList;

  TravelDestination({
    required this.destination,
    required this.destinationDescription,
    required this.dayList,
  });

  Map<String, dynamic> toJson() => {
    'destination': destination,
    'destinationDescription': destinationDescription,
    'dayList': dayList.map((day) => day.toJson()).toList(),
  };

  factory TravelDestination.fromJson(Map<String, dynamic> json) {
    var dayListJson = json['dayList'] as List;
    List<TravelDay> dayList = dayListJson
        .map((dayJson) => TravelDay.fromJson(dayJson))
        .toList();

    return TravelDestination(
      destination: json['destination'],
      destinationDescription: json['destinationDescription'],
      dayList: dayList,
    );
  }

}

class TravelDay {
  String day;
  bool isExpanded = true;
  List<TravelDayPlay> playList;

  TravelDay({
    required this.day,
    required this.playList,
  });

  Map<String, dynamic> toJson() => {
    'day': day,
    'playList': playList.map((play) => play.toJson()).toList()
  };

  factory TravelDay.fromJson(Map<String, dynamic> json) {
    var playListJson = json['playList'] as List;
    List<TravelDayPlay> playList = playListJson
        .map((playJson) => TravelDayPlay.fromJson(playJson))
        .toList();

    return TravelDay(
      day: json['day'],
      playList: playList,
    );
  }
}

class TravelDayPlay {
  String play;
  String playTime;
  int playMoney;

  TravelDayPlay({
    required this.play,
    required this.playTime,
    required this.playMoney,
  });

  Map<String, dynamic> toJson() => {
    'play': play,
    'playTime': playTime,
    'playMoney': playMoney,
  };

  factory TravelDayPlay.fromJson(Map<String, dynamic> json) {
    return TravelDayPlay(
      play: json['play'],
      playTime: json['playTime'],
      playMoney: json['playMoney'] is double ? (json['playMoney'] as double).toInt() : json['playMoney'],
    );
  }
}
