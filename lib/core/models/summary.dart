import 'countries.dart';
import 'global.dart';

class Summary {
  String? iD;
  String? message;
  Global? global;
  List<Countries>? countries;
  String? date;

  Summary({this.iD, this.message, this.global, this.countries, this.date});

  Summary.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    message = json['Message'];
    global = json['Global'] != null ? Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Message'] = message;
    if (global != null) {
      data['Global'] = global!.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries!.map((v) => v.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}

class Premium {
  Premium.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
