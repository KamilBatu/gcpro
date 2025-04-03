import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class User extends Equatable {
  const User({
    this.id = 0,
    this.username = '',
    this.password = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.image = '',
    this.token = '',
  });
  factory User.fromJson(Map<String, dynamic> map) => User(
        id: (map['id'] ?? 0) as int,
        username: (map['username'] ?? '').toString(),
        password: (map['password'] ?? '').toString(),
        email: (map['email'] ?? '').toString(),
        firstName: (map['firstName'] ?? '').toString(),
        lastName: (map['lastName'] ?? '').toString(),
        gender: (map['gender'] ?? '').toString(),
        image: (map['image'] ?? '').toString(),
        token: (map['token'] ?? '').toString(),
      );
  final int id;
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
        firstName,
        lastName,
        gender,
        image,
        token,
      ];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'token': token,
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }
}

// Manually created adapter:
// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final int typeId = 1;

//   @override
//   User read(BinaryReader reader) {
//     // Read fields in the same order as they were written
//     final id = reader.readInt();
//     final username = reader.readString();
//     final password = reader.readString();
//     final email = reader.readString();
//     final firstName = reader.readString();
//     final lastName = reader.readString();
//     final gender = reader.readString();
//     final image = reader.readString();
//     final token = reader.readString();

//     return User(
//       id: id,
//       username: username,
//       password: password,
//       email: email,
//       firstName: firstName,
//       lastName: lastName,
//       gender: gender,
//       image: image,
//       token: token,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, User obj) {
//     // Write fields in a consistent order
//     writer.writeInt(obj.id);
//     writer.writeString(obj.username);
//     writer.writeString(obj.password);
//     writer.writeString(obj.email);
//     writer.writeString(obj.firstName);
//     writer.writeString(obj.lastName);
//     writer.writeString(obj.gender);
//     writer.writeString(obj.image);
//     writer.writeString(obj.token);
//   }
// }
