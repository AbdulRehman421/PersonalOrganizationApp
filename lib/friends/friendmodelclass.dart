class FriendModelClass {
  int? id;
   String? name;
   int? age;
   String? gender;

  FriendModelClass({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
  });

  FriendModelClass.fromMap(Map<String, dynamic> res)
      : name = res["name"],
        age = res["age"],
        gender = res["gender"];


  Map<String, Object> toMap() {
    return {'name': name!, 'age': age!, 'gender': gender!,};
  }
}