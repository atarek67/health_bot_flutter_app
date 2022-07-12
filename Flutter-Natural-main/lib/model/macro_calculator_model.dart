class Macro_calculator_model {
  String? _calories;
  String? _fat;
  String? _foodName;
  String? _protein;

  Macro_calculator_model(
      {String? calories, String? fat, String? foodName, String? protein}) {
    if (calories != null) {
      this._calories = calories;
    }
    if (fat != null) {
      this._fat = fat;
    }
    if (foodName != null) {
      this._foodName = foodName;
    }
    if (protein != null) {
      this._protein = protein;
    }
  }

  String? get calories => _calories;
  set calories(String? calories) => _calories = calories;
  String? get fat => _fat;
  set fat(String? fat) => _fat = fat;
  String? get foodName => _foodName;
  set foodName(String? foodName) => _foodName = foodName;
  String? get protein => _protein;
  set protein(String? protein) => _protein = protein;

  Macro_calculator_model.fromJson(Map<String, dynamic> json) {
    _calories = json['calories'];
    _fat = json['fat'];
    _foodName = json['food_name'];
    _protein = json['protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this._calories;
    data['fat'] = this._fat;
    data['food_name'] = this._foodName;
    data['protein'] = this._protein;
    return data;
  }
}
