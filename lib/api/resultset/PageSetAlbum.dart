import 'package:pjc_app/model/Album.dart';

class PageSetAlbum {
  List<Album> result;
  final int size;
  final int pageSize;
  final int page;
  final int pages;

  PageSetAlbum(List<Album> album,
      {this.result, this.size, this.pageSize, this.page, this.pages});

  factory PageSetAlbum.fromJson(Map<String, dynamic> json) {
    var albumObjsJson = json['result'] as List;

    List<Album> _album = albumObjsJson
        .map((albumObjsJson) => Album.fromJson(albumObjsJson))
        .toList();
    return PageSetAlbum(_album,
        size: json['size'],
        pageSize: json['pageSize'],
        page: json['page'],
        pages: json['pages']);
  }
}
