class Model {
  List<Data>? data;
  Meta? meta;
  Links? links;

  Model({this.data, this.meta, this.links});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? type;
  Attributes? attributes;
  Relationships? relationships;

  Data({this.id, this.type, this.attributes, this.relationships});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? new Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? description;
  Life? life;
  Life? maleWeight;
  Life? femaleWeight;
  bool? hypoallergenic;

  Attributes(
      {this.name,
        this.description,
        this.life,
        this.maleWeight,
        this.femaleWeight,
        this.hypoallergenic});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    life = json['life'] != null ? new Life.fromJson(json['life']) : null;
    maleWeight = json['male_weight'] != null
        ? new Life.fromJson(json['male_weight'])
        : null;
    femaleWeight = json['female_weight'] != null
        ? new Life.fromJson(json['female_weight'])
        : null;
    hypoallergenic = json['hypoallergenic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (life != null) {
      data['life'] = life!.toJson();
    }
    if (maleWeight != null) {
      data['male_weight'] = maleWeight!.toJson();
    }
    if (femaleWeight != null) {
      data['female_weight'] = femaleWeight!.toJson();
    }
    data['hypoallergenic'] = hypoallergenic;
    return data;
  }
}

class Life {
  int? max;
  int? min;

  Life({this.max, this.min});

  Life.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['min'] = min;
    return data;
  }
}

class Relationships {
  Group? group;

  Relationships({this.group});

  Relationships.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class Group {
  GroupData? groupData;
  GroupData? data;

  Group({this.groupData, this.data});

  Group.fromJson(Map<String, dynamic> json) {
    groupData = json['data'] != null
        ? new GroupData.fromJson(json['data'])
        : null;
    data = json['data'] != null ? new GroupData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groupData != null) {
      data['data'] = groupData!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GroupData {
  String? id;
  String? type;

  GroupData({this.id, this.type});

  GroupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? current;
  int? records;

  Pagination({this.current, this.records});

  Pagination.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    records = json['records'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['records'] = records;
    return data;
  }
}

class Links {
  String? self;
  String? current;

  Links({this.self, this.current});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['current'] = current;
    return data;
  }
}
