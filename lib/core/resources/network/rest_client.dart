import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/api/pusdatin-service/permohonan-bangunan')
  Future doGetListForm();

  @GET('/api/pusdatin-service/permohonan-bangunan/kelompok')
  Future doGetListGroup();

  @POST('/api/pusdatin-service/permohonan-bangunan')
  Future doPostForm(@Body() Map<String, dynamic> data);

  @PUT('/api/pusdatin-service/permohonan-bangunan/{id}')
  Future doPutForm(@Path('id') int id, @Body() Map<String, dynamic> data);
}
