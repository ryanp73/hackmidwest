class Bar{
  double lat;
  double long;
  String location;
  String name;

  Bar({this.lat, this.long, this.location, this.name});

  factory Bar.fromJson(Map<String, dynamic> json){
    return Bar(
      lat: json['lat'],
      long: json['lng'],
      location: json['location'],
      name: json['name'],
    );
  }
}