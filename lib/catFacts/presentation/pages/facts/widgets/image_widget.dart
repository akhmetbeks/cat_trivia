import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cat_image/cat_image_bloc.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatImageBloc, CatImageState>(
      builder: (context, state) {
        if (state is CatImageLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CatImageLoaded) {
          return Image.memory(state.image);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
