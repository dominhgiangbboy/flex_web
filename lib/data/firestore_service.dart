import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_flex_website/data/models.dart';

const String _collectionName = 'flex_website';
const String _documentName = 'projects';

class FirestoreService {
  static final FirestoreService instance = FirestoreService._();
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;
  FirestoreService._();

  Future<List<ProjectModel>> getProjectData() {
    return _firestore.collection(_collectionName).get().then((value) {
      try {
        final List<ProjectModel> projects = value.docs.map((element) => ProjectModel.fromMap(element.data())).toList();
        return projects;
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}

class ProjectModelList {
  final List<ProjectModel> projects;
  ProjectModelList({
    required this.projects,
  });

  Map<String, dynamic> toMap() {
    return {
      'projects': projects.map((x) => x.toMap()).toList(),
    };
  }

  factory ProjectModelList.fromMap(Map<String, dynamic> map) {
    return ProjectModelList(
      projects: List<ProjectModel>.from(map['projects']?.map((x) => ProjectModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModelList.fromJson(String source) => ProjectModelList.fromMap(json.decode(source));
}
