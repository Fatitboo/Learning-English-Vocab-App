class TopicDTO {

  int? id;
  String? topicName;
  String? topicDescription;
  String? topicImage;

  TopicDTO(
    this.id,
    this.topicName,
    this.topicDescription,
    this.topicImage,
  );

  TopicDTO.init();

  factory TopicDTO.fromJson(Map<String, dynamic> json) {
    TopicDTO item = TopicDTO(
      json["id"] ?? "",
      json["topicName"] ?? "",
      json["topicDescription"] ?? "",
      json["topicImage"] ?? ""
    );
    return item;
  }

  Map<String, dynamic> toJson(TopicDTO topicDTO) {
    return {
      "id": topicDTO.id,
      "topicName": topicDTO.topicName,
      "topicDescription": topicDTO.topicDescription,
      "topicImage": topicDTO.topicImage,
    };
  }
}