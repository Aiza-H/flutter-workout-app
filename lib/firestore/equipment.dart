class Equipment{
  String _name;
  String _brand;
  String _model;
  String _type;

  Equipment(this._name,this._brand,this._model,this._type);

  Equipment.map(dynamic obj){
    this._name = obj['name'];
    this._brand = obj['brand'];
    this._model = obj['model'];
    this._type = obj['type'];
  }

  String get  name=> _name;
  String get brand => _brand;
  String get model => _model;
  String get type => _type;

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['name']= _name;
     map['brand'] = _brand;
    map['model'] = _model;
    map['type'] = _type;
    return map;
  }

  Equipment.fromMap(Map<String,dynamic> map){
    this._name= map['name'];
    this._brand = map['brand'];
    this._model = map['model'];
    this._type = map['type'];
  }
}