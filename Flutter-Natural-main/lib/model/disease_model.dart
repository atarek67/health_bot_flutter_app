class Disease_model {
  String? _description;
  String? _name;

  Disease_model({String? description, String? name}) {
    if (description != null) {
      this._description = description;
    }
    if (name != null) {
      this._name = name;
    }
  }

  String? get description => _description;
  set description(String? description) => _description = description;
  String? get name => _name;
  set name(String? name) => _name = name;

  Disease_model.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['name'] = this._name;
    return data;
  }
}
