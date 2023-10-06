part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<String> categoryList;
  const CategoryLoaded(this.categoryList);
}

class CategoryError extends CategoryState {
  final String? message;

  const CategoryError(this.message);
}
