import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/fact_model.dart';

part 'rest_service.g.dart';

class Apis {
  static const String fact = 'https://catfact.ninja/fact';
  static const String image = 'https://cataas.com/cat';
}

@RestApi()
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @GET(Apis.fact)
  Future<FactModel> getFact();

  @GET(Apis.image)
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getImage();
}
