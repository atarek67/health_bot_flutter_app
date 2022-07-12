class User_profile_model {
  String? _birthDate;
  double? _currentWeight;
  int? _dailyCalorise;
  bool _doNaturalPlanBefore=false;
  double? _goalWeight;
  bool _haveChronicDisease=false;
  double? _long;
  String? _name;
  String? _sex;
  Map<String,dynamic> ?_chronic_disease = {};

  User_profile_model(
      {String? birthDate,
        double? currentWeight,
        int? dailyCalorise,
        bool? doNaturalPlanBefore,
        double? goalWeight,
        Map<String,bool> ?chronic_disease,
        bool? haveChronicDisease,
        double? long,
        String? name,
        String? sex}) {
    if (birthDate != null) {
      this._birthDate = birthDate;
    }
    if (currentWeight != null) {
      this._currentWeight = currentWeight;
    }
    if (dailyCalorise != null) {
      this._dailyCalorise = dailyCalorise;
    }
    if (doNaturalPlanBefore != null) {
      this._doNaturalPlanBefore = doNaturalPlanBefore;
    }
    if (goalWeight != null) {
      this._goalWeight = goalWeight;
    }
    if (haveChronicDisease != null) {
      this._haveChronicDisease = haveChronicDisease;
    }
    if (long != null) {
      this._long = long;
    }
    if (name != null) {
      this._name = name;
    }
    if (sex != null) {
      this._sex = sex;
    }
    if(_chronic_disease!= null){
      this._chronic_disease = _chronic_disease;
    }
  }

  String? get birthDate => _birthDate;
  set birthDate(String? birthDate) => _birthDate = birthDate;
  double? get currentWeight => _currentWeight;
  set currentWeight(double? currentWeight) => _currentWeight = currentWeight;
  int? get dailyCalorise => _dailyCalorise;
  set dailyCalorise(int? dailyCalorise) => _dailyCalorise = dailyCalorise;
  bool get doNaturalPlanBefore => _doNaturalPlanBefore;
  set doNaturalPlanBefore(bool doNaturalPlanBefore) =>
      _doNaturalPlanBefore = doNaturalPlanBefore;
  double? get goalWeight => _goalWeight;
  set goalWeight(double? goalWeight) => _goalWeight = goalWeight;
  bool get haveChronicDisease => _haveChronicDisease;
  set haveChronicDisease(bool haveChronicDisease) =>
      _haveChronicDisease = haveChronicDisease;
  double? get long => _long;
  set long(double? long) => _long = long;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get sex => _sex;
  set sex(String? sex) => _sex = sex;
  Map<String, dynamic>? get chronic_disease => _chronic_disease;
  set chronic_disease(Map<String, dynamic>? value) {
    _chronic_disease = value;
  }

  User_profile_model.fromJson(Map<String, dynamic> json) {
    _birthDate = json['birth_date'];
    _currentWeight = double.parse(json['current_weight'].toString());
    _dailyCalorise = json['daily_calorise'];
    _doNaturalPlanBefore = json['do_natural_plan_before'];
    _goalWeight = double.parse(json['goal_weight'].toString());
    _haveChronicDisease = json['have_chronic_disease'];
    _long = double.parse(json['long'].toString());
    _name = json['name'];
    _sex = json['sex'];
    _chronic_disease!.addAll(json['chronic disease']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birth_date'] = this._birthDate;
    data['current_weight'] = this._currentWeight;
    data['daily_calorise'] = this._dailyCalorise;
    data['do_natural_plan_before'] = this._doNaturalPlanBefore;
    data['goal_weight'] = this._goalWeight;
    data['have_chronic_disease'] = this._haveChronicDisease;
    data['long'] = this._long;
    data['name'] = this._name;
    data['sex'] = this._sex;
    data['chronic disease'] = this._chronic_disease;
    return data;
  }


}
