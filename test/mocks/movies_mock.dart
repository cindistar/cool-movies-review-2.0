import 'package:coolmovies/data/models/models.dart';
import 'package:coolmovies/domain/entities/entities.dart';

class MoviesMock {
  static MoviesModel get moviesModel => const MoviesModel(
        idModel: '5835e35c-c357-4a85-8f8b-03c7ab3c0a83',
        imgUrlModel:
            'https://upload.wikimedia.org/wikipedia/pt/2/22/Titanic_poster.jpg',
        titleModel: 'Titanic',
        releaseDateModel: '1999-10-10',
        nodeIdModel: 'FGTY-JJJJ-LLLL-UUUU',
      );

  static MoviesEntity get moviesEntity => MoviesEntity(
        id: moviesModel.idModel,
        imgUrl: moviesModel.imgUrlModel,
        title: moviesModel.titleModel,
        releaseDate: moviesModel.releaseDateModel,
        nodeId: moviesModel.nodeIdModel,
      );

  static Map<String, dynamic> get moviesJson {
    return {
      "allMovies": {
        "nodes": [
          {
            "id": moviesModel.idModel,
            "imgUrl": moviesModel.imgUrlModel,
            "title": moviesModel.titleModel,
            "releaseDate": moviesModel.releaseDateModel,
            "nodeId": moviesModel.nodeId
          }
        ]
      }
    };
  }
}
