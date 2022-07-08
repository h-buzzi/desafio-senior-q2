class Movies {
  late int _total;
  late List<MoviesByYear> _moviesByYear;

  Movies(Map<String, dynamic> json) {
    _total = json['total'];
    _moviesByYear = [];
    if (json['moviesByYear'] != null) {
      json['moviesByYear'].forEach((v) {
        _moviesByYear.add(MoviesByYear(v));
      });
    }
  }

  int get total => _total;
  List<MoviesByYear> get moviesByYear => _moviesByYear;
}

class MoviesByYear {
  late int _year;
  late int _moviesCount;

  MoviesByYear(Map<String, dynamic> json) {
    _year = json['year'];
    _moviesCount = json['movies'];
  }

  int get year => _year;
  int get moviesCount => _moviesCount;
}
