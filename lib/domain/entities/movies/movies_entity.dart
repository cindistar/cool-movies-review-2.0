import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  const MoviesEntity({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.releaseDate,
    required this.nodeId,
  });
  final String id;
  final String imgUrl;
  final String title;
  final String releaseDate;
  final String nodeId;

  @override
  List<Object> get props {
    return [
      id,
      imgUrl,
      title,
      releaseDate,
      nodeId,
    ];
  }
}
