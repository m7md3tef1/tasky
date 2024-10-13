/// _id : "67066c94ed5aa194fac3ddb9"
/// image : "path.png"
/// title : "title"
/// desc : "desc"
/// priority : "low"
/// status : "waiting"
/// user : "6649fb2eef0bf93dd00711ba"
/// createdAt : "2024-10-09T11:44:20.090Z"
/// updatedAt : "2024-10-09T11:44:20.090Z"
/// __v : 0

class Tasks {
  Tasks({
      String? id,
      String? image,
      String? title,
      String? desc,
      String? priority,
      String? status,
      String? user,
      String? createdAt,
      String? updatedAt,
      num? v,}){
    _id = id;
    _image = image;
    _title = title;
    _desc = desc;
    _priority = priority;
    _status = status;
    _user = user;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Tasks.fromJson(dynamic json) {
    _id = json['_id'];
    _image = json['image'];
    _title = json['title'];
    _desc = json['desc'];
    _priority = json['priority'];
    _status = json['status'];
    _user = json['user'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _image;
  String? _title;
  String? _desc;
  String? _priority;
  String? _status;
  String? _user;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Tasks copyWith({  String? id,
  String? image,
  String? title,
  String? desc,
  String? priority,
  String? status,
  String? user,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Tasks(  id: id ?? _id,
  image: image ?? _image,
  title: title ?? _title,
  desc: desc ?? _desc,
  priority: priority ?? _priority,
  status: status ?? _status,
  user: user ?? _user,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get image => _image;
  String? get title => _title;
  String? get desc => _desc;
  String? get priority => _priority;
  String? get status => _status;
  String? get user => _user;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['image'] = _image;
    map['title'] = _title;
    map['desc'] = _desc;
    map['priority'] = _priority;
    map['status'] = _status;
    map['user'] = _user;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}