part of 'cat_image_bloc.dart';

abstract class CatImageState extends Equatable {
  const CatImageState();

  @override
  List<Object> get props => [];
}

class CatImageInitial extends CatImageState {}

class CatImageLoading extends CatImageState {}

class CatImageLoaded extends CatImageState {
  final dynamic image;

  const CatImageLoaded({required this.image});

  @override
  List<Object> get props => [image];
}

class CatImageError extends CatImageState {}
