import 'package:dartz/dartz.dart';
import 'package:form_listing_test/core/resources/model/detail/detail_model.dart';
import 'package:form_listing_test/core/resources/model/list_form/list_form_model.dart';
import 'package:form_listing_test/core/resources/model/list_group/list_group_model.dart';
import 'package:form_listing_test/core/resources/network/rest_client.dart';
import 'package:form_listing_test/core/resources/repositories/interface.dart';
import 'package:form_listing_test/core/utils/base_response/base_response.dart';
import 'package:form_listing_test/core/utils/base_response/response_helper.dart';
import 'package:form_listing_test/core/utils/errors/failure.dart';

class Repository extends InterfaceRepo {
  final RestClient restClient;

  Repository({required this.restClient});

  @override
  Future<Either<Failure, BaseResponse<ListFormResponse>>> doGetListForm() async {
    Object response = await ResponseHelper.getResponse(() async => await restClient.doGetListForm());

    if (response is Failure) return Left(response);

    return Right(BaseResponse(response: ListFormResponse.fromJson(response as Map<String, dynamic>), errorMessage: null, status: true));
  }

  @override
  Future<Either<Failure, BaseResponse<ListGroupResponse>>> doGetListGroup() async {
    Object response = await ResponseHelper.getResponse(() async => await restClient.doGetListGroup());
    if (response is Failure) return Left(response);

    return Right(BaseResponse(
      response: ListGroupResponse.fromJson(response as Map<String, dynamic>),
      errorMessage: null,
      status: true,
    ));
  }

  @override
  Future<Either<Failure, BaseResponse>> doPostFrom({required String? identifikasi, required int? noUrut, required int? idKelompok}) async {
    Map<String, dynamic> params = {
      'identifikasi': identifikasi,
      'noUrut': noUrut,
      'idKelompok': idKelompok,
    };

    Object response = await ResponseHelper.getResponse(() async => await restClient.doPostForm(params));

    if (response is Failure) return Left(response);
    return Right(BaseResponse(response: response, errorMessage: null, status: true));
  }

  @override
  Future<Either<Failure, BaseResponse>> doPutDetail({required int id, required String? identifikasi, required int? idKelompok}) async {
    Map<String, dynamic> params = {
      'id': id,
      'identifikasi': identifikasi,
      'idKelompok': idKelompok,
    };
    Object response = await ResponseHelper.getResponse(() async => await restClient.doPutForm(id, params));
    if (response is Failure) return Left(response);

    return Right(BaseResponse(response: DetailModel.fromJson(response as Map<String, dynamic>), errorMessage: null, status: true));
  }
}
