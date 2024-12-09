class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final num voteAverage;
  final String release;
  final num voteCount;
  final String originalLanguage;
  final String orginalTitle;
  Movie(
      {required this.release,
      required this.voteCount,
      required this.originalLanguage,
      required this.overview,
      required this.voteAverage,
      required this.orginalTitle,
      required this.title,
      required this.backDropPath});
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        title: map['title'],
        release: map['release_date'],
        originalLanguage: map['original_language'],
        voteCount: map['vote_count'],
        overview: map['overview'],
        voteAverage: map['vote_average'],
        orginalTitle: map['original_title'],
        backDropPath: map['backdrop_path']);
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'release': release,
      'voteCount': voteCount,
      'originalLanguage': originalLanguage,
      'backDropPath': backDropPath,
      'overview': overview,
      ' voteAverage': voteAverage,
      'orginalTitle': orginalTitle,
    };
  }
}
