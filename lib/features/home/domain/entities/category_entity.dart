import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String icon;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, name, icon];
}
