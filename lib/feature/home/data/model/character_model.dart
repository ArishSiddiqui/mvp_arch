// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  int id;
  String name;
  List<String> images;
  Map<String, dynamic>? family;
  Map<String, dynamic>? personal;
  Map<String, dynamic>? voiceActors;

  CharacterModel({
    required this.id,
    required this.name,
    required this.images,
    required this.family,
    required this.personal,
    required this.voiceActors,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        family: json["family"],
        personal: json["personal"],
        voiceActors: json["voiceActors"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x)),
        "family": family,
        "personal": personal,
        "voiceActors": voiceActors,
      };
}
