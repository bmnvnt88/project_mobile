// class Photo {
//   String? name;
//   String? img;
//   String? level;

//   Photo({this.name, this.img, this.level});

//   Photo.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     img = json['img'];
//     level = json['level'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['img'] = this.img;
//     data['level'] = this.level;
//     return data;
//   }
// }

class Photo {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Photo(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
        json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    if (this.origin != null) {
      data['origin'] = this.origin!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    data['episode'] = this.episode;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}



// class Photo {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? fullName;
//   String? title;
//   String? family;
//   String? image;
//   String? imageUrl;

//   Photo(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.fullName,
//       this.title,
//       this.family,
//       this.image,
//       this.imageUrl});

//   Photo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     fullName = json['fullName'];
//     title = json['title'];
//     family = json['family'];
//     image = json['image'];
//     imageUrl = json['imageUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['firstName'] = this.firstName;
//     data['lastName'] = this.lastName;
//     data['fullName'] = this.fullName;
//     data['title'] = this.title;
//     data['family'] = this.family;
//     data['image'] = this.image;
//     data['imageUrl'] = this.imageUrl;
//     return data;
//   }
// }
