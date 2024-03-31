import 'dart:convert';

import 'package:coolmovies/domain/entities/movies/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  final String idModel;
  final String imgUrlModel;
  final String titleModel;
  final String releaseDateModel;
  final String nodeIdModel;
  const MoviesModel({
    required this.idModel,
    required this.imgUrlModel,
    required this.titleModel,
    required this.releaseDateModel,
    required this.nodeIdModel,
  }) : super(
          id: idModel,
          imgUrl: imgUrlModel,
          title: titleModel,
          releaseDate: releaseDateModel,
          nodeId: nodeIdModel,
        );

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      idModel: map['id'] as String,
      imgUrlModel: map['imgUrl'] as String,
      titleModel: map['title'] as String,
      releaseDateModel: map['releaseDate'] as String,
      nodeIdModel: map['nodeId'] as String,
    );
  }

  factory MoviesModel.fromJson(String source) =>
      MoviesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      idModel,
      imgUrlModel,
      titleModel,
      releaseDateModel,
      nodeIdModel,
    ];
  }
}
