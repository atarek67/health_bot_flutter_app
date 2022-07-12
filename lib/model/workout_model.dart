class Workout_model {
  String? _description;
  String? _exerciseName;
  String? _imageLink;
  String? _youtubeLink;

  Workout_model(
      {String? description,
        String? exerciseName,
        String? imageLink,
        String? youtubeLink}) {
    if (description != null) {
      this._description = description;
    }
    if (exerciseName != null) {
      this._exerciseName = exerciseName;
    }
    if (imageLink != null) {
      this._imageLink = imageLink;
    }
    if (youtubeLink != null) {
      this._youtubeLink = youtubeLink;
    }
  }

  String? get description => _description;
  set description(String? description) => _description = description;
  String? get exerciseName => _exerciseName;
  set exerciseName(String? exerciseName) => _exerciseName = exerciseName;
  String? get imageLink => _imageLink;
  set imageLink(String? imageLink) => _imageLink = imageLink;
  String? get youtubeLink => _youtubeLink;
  set youtubeLink(String? youtubeLink) => _youtubeLink = youtubeLink;

  Workout_model.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _exerciseName = json['exercise_name'];
    _imageLink = json['image_link'];
    _youtubeLink = json['youtube_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['exercise_name'] = this._exerciseName;
    data['image_link'] = this._imageLink;
    data['youtube_link'] = this._youtubeLink;
    return data;
  }
}
