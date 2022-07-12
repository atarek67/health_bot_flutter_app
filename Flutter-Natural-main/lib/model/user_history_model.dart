class User_history_model {
  int? _calories;
  int? _waterCup;
  String? _Date;

  User_history_model({int? calories, int? waterCup}) {
    if (calories != null) {
      this._calories = calories;
    }
    if (waterCup != null) {
      this._waterCup = waterCup;
    }
  }

  int? get calories => _calories;
  set calories(int? calories) => _calories = calories;
  int? get waterCup => _waterCup;
  set waterCup(int? waterCup) => _waterCup = waterCup;
  String? get Date => _Date;
  set Date(String? value) => _Date = value;



  User_history_model.fromJson(Map<String, dynamic> json,String date) {
    _calories = json['calories'];
    _waterCup = json['water_cup'];
    _Date = date;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this._calories;
    data['water_cup'] = this._waterCup;
    return data;
  }


}
