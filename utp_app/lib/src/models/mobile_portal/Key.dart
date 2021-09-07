import 'dart:convert';

Key keyFromJson(String str) => Key.fromJson(json.decode(str));

String keyToJson(Key data) => json.encode(data.toJson());

class Key {
  
  Key({
      this.key,
  });

  String key;

  factory Key.fromJson(Map<String, dynamic> json) => Key(
      key: json["key"],
  );

  Map<String, dynamic> toJson() => {
      "key": key,
  };
}
