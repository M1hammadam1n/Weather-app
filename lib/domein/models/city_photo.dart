class CityPhotos {
  int? total;
  int? totalPages;
  List<Results>? results;

  CityPhotos({this.total, this.totalPages, this.results});

  CityPhotos.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? createdAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  int? likes;
  bool? likedByUser;
  String? description;
  User? user;
  Urls? urls;
  Links? links;

  Results(
      {this.id,
      this.createdAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.likes,
      this.likedByUser,
      this.description,
      this.user,
      this.urls,
      this.links});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['width'] = width;
    data['height'] = height;
    data['color'] = color;
    data['blur_hash'] = blurHash;
    data['likes'] = likes;
    data['liked_by_user'] = likedByUser;
    data['description'] = description;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? instagramUsername;
  String? twitterUsername;
  String? portfolioUrl;
  ProfileImage? profileImage;
  Links? links;

  User(
      {this.id,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.instagramUsername,
      this.twitterUsername,
      this.portfolioUrl,
      this.profileImage,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    instagramUsername = json['instagram_username'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['instagram_username'] = instagramUsername;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? photos;
  String? likes;

  Links({this.self, this.html, this.photos, this.likes});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['photos'] = photos;
    data['likes'] = likes;
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['raw'] = raw;
    data['full'] = full;
    data['regular'] = regular;
    data['small'] = small;
    data['thumb'] = thumb;
    return data;
  }
}

class Link {
  String? self;
  String? html;
  String? download;

  Link({this.self, this.html, this.download});

  Link.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['html'] = html;
    data['download'] = download;
    return data;
  }
}