class WordDTO {

  int? id;
  String? wordName;
  String? wordMean;
  String? spelling;
  String? image;
  String? wordType;
  String? audio;
  bool? saved;

  WordDTO(
      this.id,
      this.wordName,
      this.wordMean,
      this.spelling,
      this.image,
      this.wordType,
      this.audio,
      this.saved
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
        json["audio"] ?? "",
        json["saved"] ?? true,
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
      "audio": wordDTO.audio,
      "saved": wordDTO.saved,
    };
  }
}