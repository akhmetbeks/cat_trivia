import 'package:bloc/bloc.dart';
import '../../domain/usecases/get_image_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cat_image_event.dart';
part 'cat_image_state.dart';

class CatImageBloc extends Bloc<CatImageEvent, CatImageState> {
  final GetImageUsecase getImageUsecase;
  CatImageBloc({
    required this.getImageUsecase,
  }) : super(CatImageInitial()) {
    on<LoadCatImageEvent>((event, emit) async {
      emit(CatImageLoading());
      try {
        final image = await getImageUsecase(Type);
        emit(CatImageLoaded(image: image));
      } catch (e) {
        emit(CatImageError());
      }
    });
  }
}
