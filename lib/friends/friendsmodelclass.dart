class FriendsModelClass {
  final int? id;
  final String fname;
  final String lname;
  final int age;
  final String address;
  final String gender;

  FriendsModelClass({
    this.id,
    required  this.fname,
    required this.lname,
    required this.age,
    required this.address,
    required this.gender,
  });

  FriendsModelClass.fromMap(Map<String, dynamic> obj)
      : id = obj["id"],
        fname = obj["fname"],
        lname = obj["lname"],
        age = obj["age"],
        address = obj["address"],
        gender = obj["gender"];



  Map<String, Object> toMap() {
    return {'id':id!, 'fname': fname,'lname': lname, 'age': age, 'address': address,'gender' : gender};
  }
}