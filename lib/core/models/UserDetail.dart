/// _id : "6649fb2eef0bf93dd00711ba"
/// displayName : "Morad Abdelgaber"
/// username : "+201010558269"
/// roles : ["user"]
/// active : true
/// experienceYears : 10
/// address : "Mit ghamr , Dakahlia , Egypt"
/// level : "senior"
/// createdAt : "2024-05-19T13:14:22.412Z"
/// updatedAt : "2024-05-19T13:14:22.412Z"
/// __v : 0

class UserDetail {
  UserDetail({
      String? id,
      String? displayName,
      String? username,
      List<String>? roles,
      bool? active,
      num? experienceYears,
      String? address,
      String? level,
      String? createdAt,
      String? updatedAt,
      num? v,}){
    _id = id;
    _displayName = displayName;
    _username = username;
    _roles = roles;
    _active = active;
    _experienceYears = experienceYears;
    _address = address;
    _level = level;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  UserDetail.fromJson(dynamic json) {
    _id = json['_id'];
    _displayName = json['displayName'];
    _username = json['username'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _active = json['active'];
    _experienceYears = json['experienceYears'];
    _address = json['address'];
    _level = json['level'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String ?_id;
  String? _displayName;
  String? _username;
  List<String>? _roles;
  bool? _active;
  num? _experienceYears;
  String? _address;
  String? _level;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
UserDetail copyWith({  String? id,
  String? displayName,
  String? username,
  List<String> ?roles,
  bool ?active,
  num? experienceYears,
  String ?address,
  String? level,
  String? createdAt,
  String ?updatedAt,
  num? v,
}) => UserDetail(  id: id ?? _id,
  displayName: displayName ?? _displayName,
  username: username ?? _username,
  roles: roles ?? _roles,
  active: active ?? _active,
  experienceYears: experienceYears ?? _experienceYears,
  address: address ?? _address,
  level: level ?? _level,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get displayName => _displayName;
  String? get username => _username;
  List<String>? get roles => _roles;
  bool? get active => _active;
  num ?get experienceYears => _experienceYears;
  String? get address => _address;
  String? get level => _level;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['displayName'] = _displayName;
    map['username'] = _username;
    map['roles'] = _roles;
    map['active'] = _active;
    map['experienceYears'] = _experienceYears;
    map['address'] = _address;
    map['level'] = _level;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}