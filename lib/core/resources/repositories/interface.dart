import 'package:dartz/dartz.dart';
import 'package:form_listing_test/core/resources/model/detail/detail_model.dart';
import 'package:form_listing_test/core/resources/model/list_form/list_form_model.dart';
import 'package:form_listing_test/core/resources/model/list_group/list_group_model.dart';
import 'package:form_listing_test/core/utils/base_response/base_response.dart';
import 'package:form_listing_test/core/utils/errors/failure.dart';

abstract class InterfaceRepo {
  Future<Either<Failure, BaseResponse<ListFormResponse>>> doGetListForm();

  Future<Either<Failure, BaseResponse<ListGroupResponse>>> doGetListGroup();

  Future<Either<Failure, BaseResponse<dynamic>>> doPostFrom({
    required String? identifikasi,
    required int? noUrut,
    required int? idKelompok,
  });

  Future<Either<Failure, BaseResponse<dynamic>>> doPutDetail({
    required int id,
    required String? identifikasi,
    required int? idKelompok,
  });
}
