class Planet {

  final int id;
  final String name;
  final String image;
  final String description;
  final String volume;
  final String mass;

  Planet(
    this.id,
    this.name,
    this.image,
    this.description,
    this.volume,
    this.mass,
  );

  Planet.fromJson(dynamic json)
    : id = json['id'],
      name = json['name'],
      image = json['imgSrc']['img'],
      description = json['description'],
      volume = json['basicDetails']['volume'],
      mass = json['basicDetails']['mass'];

}