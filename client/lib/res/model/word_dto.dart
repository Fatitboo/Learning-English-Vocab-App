class WordDTO {

  int? id;
  String? wordName;
  String? wordMean;
  String? spelling;
  String? image;
  String? wordType;
  String? audio;

  WordDTO(
      this.id,
      this.wordName,
      this.wordMean,
      this.spelling,
      this.image,
      this.wordType,
      this.audio
  );

  WordDTO.init();

  factory WordDTO.fromJson(Map<String, dynamic> json) {
    WordDTO item = WordDTO(
        json["id"] ?? "",
        json["wordName"] ?? "",
        json["wordMean"] ?? "",
        json["spelling"] ?? "",
        json["image"] ?? "",
        json["wordType"] ?? "",
        json["audio"] ?? ""
    );
    return item;
  }

  Map<String, dynamic> toJson(WordDTO wordDTO) {
    return {
      "id": wordDTO.id,
      "wordName": wordDTO.wordName,
      "wordMean": wordDTO.wordMean,
      "spelling": wordDTO.spelling,
      "image": wordDTO.image,
      "wordType": wordDTO.wordType,
      "audio": wordDTO.audio
    };
  }
}