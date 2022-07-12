class Daily_mail_model {
  String? _fats;
  String? _fruits;
  String? _leanMeats;
  String? _nonfatMilk;
  String? _starch;
  String? _vegetables;

  Daily_mail_model(
      {String? fats,
        String? fruits,
        String? leanMeats,
        String? nonfatMilk,
        String? starch,
        String? vegetables}) {
    if (fats != null) {
      this._fats = fats;
    }
    if (fruits != null) {
      this._fruits = fruits;
    }
    if (leanMeats != null) {
      this._leanMeats = leanMeats;
    }
    if (nonfatMilk != null) {
      this._nonfatMilk = nonfatMilk;
    }
    if (starch != null) {
      this._starch = starch;
    }
    if (vegetables != null) {
      this._vegetables = vegetables;
    }
  }

  String? get fats => _fats;
  set fats(String? fats) => _fats = fats;
  String? get fruits => _fruits;
  set fruits(String? fruits) => _fruits = fruits;
  String? get leanMeats => _leanMeats;
  set leanMeats(String? leanMeats) => _leanMeats = leanMeats;
  String? get nonfatMilk => _nonfatMilk;
  set nonfatMilk(String? nonfatMilk) => _nonfatMilk = nonfatMilk;
  String? get starch => _starch;
  set starch(String? starch) => _starch = starch;
  String? get vegetables => _vegetables;
  set vegetables(String? vegetables) => _vegetables = vegetables;

  Daily_mail_model.fromJson(Map<String, dynamic> json) {
    _fats = json['Fats'];
    _fruits = json['Fruits'];
    _leanMeats = json['Lean meats'];
    _nonfatMilk = json['Nonfat milk'];
    _starch = json['Starch'];
    _vegetables = json['Vegetables'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[' Fats'] = this._fats;
    data['Fruits'] = this._fruits;
    data['Lean meats'] = this._leanMeats;
    data['Nonfat milk'] = this._nonfatMilk;
    data['Starch'] = this._starch;
    data['Vegetables'] = this._vegetables;
    return data;
  }
}
