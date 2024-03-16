import 'package:json_annotation/json_annotation.dart';

part 'list_form_model.g.dart';

@JsonSerializable()
class ListFormResponse {
  final List<ListFormModel>? data;

  ListFormResponse({this.data});

  factory ListFormResponse.fromJson(Map<String, dynamic> json) => _$ListFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFormResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListFormModel {
  final int id;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final String? identifikasi;
  final int? noUrut;
  final int? idKelompok;
  final String? bentuk;
  final String? jenis;

  ListFormModel({
     required this.id,
     this.createdAt,
     this.updatedAt,
     this.createdBy,
     this.updatedBy,
     this.identifikasi,
     this.noUrut,
     this.idKelompok,
     this.bentuk,
     this.jenis,
  });

  factory ListFormModel.fromJson(Map<String, dynamic> json) => _$ListFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListFormModelToJson(this);
}
