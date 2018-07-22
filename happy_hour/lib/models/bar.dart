class Bar{
  double lat;
  double long;
  String location;
  String name;
  List<dynamic> happyHour;
  String price;
  double rating;
  String url;

  Bar({this.happyHour, this.url, this.lat, this.long, this.location, this.name, this.price, this.rating});

  factory Bar.fromJson(Map<String, dynamic> json){
    print(json['happy_hour']);
    return Bar(
      happyHour: json['happy_hour'],
      lat: json['lat'],
      long: json['lng'],
      location: json['location'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      url: json['url']
    );
  }
}