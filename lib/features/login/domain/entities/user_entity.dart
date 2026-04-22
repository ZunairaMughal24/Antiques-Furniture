import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profilePic;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.profilePic,
  });

  @override
  List<Object?> get props => [id, email, name, profilePic];
}
