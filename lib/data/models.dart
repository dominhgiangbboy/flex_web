import 'dart:convert';

class SkillItemModel {
  final String name;
  final String description;

  SkillItemModel({
    required this.name,
    required this.description,
  });

  SkillItemModel copyWith({
    String? name,
    String? description,
  }) {
    return SkillItemModel(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class SkillModel {
  final String name;
  final String description;
  final List<SkillItemModel> items;

  SkillModel({
    required this.name,
    required this.description,
    required this.items,
  });

  SkillModel copyWith({
    String? name,
    String? description,
    List<SkillItemModel>? items,
  }) {
    return SkillModel(
      name: name ?? this.name,
      description: description ?? this.description,
      items: items ?? this.items,
    );
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class ProjectModel {
  final String name;
  final String description;
  final String image;
  final String url;
  final String link;
  final String techStack;
  ProjectModel({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    required this.link,
    required this.techStack,
  });

  ProjectModel copyWith({
    String? name,
    String? description,
    String? image,
    String? url,
    String? link,
    String? techStack,
  }) {
    return ProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      url: url ?? this.url,
      link: link ?? this.link,
      techStack: techStack ?? this.techStack,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'url': url,
      'link': link,
      'techStack': techStack,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      url: map['url'] ?? '',
      link: map['link'] ?? '',
      techStack: map['techStack'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));
}
