// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFormResponse _$ListFormResponseFromJson(Map<String, dynamic> json) =>
    ListFormResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListFormModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListFormResponseToJson(ListFormResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ListFormModel _$ListFormModelFromJson(Map<String, dynamic> json) =>
    ListFormModel(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      identifikasi: json['identifikasi'] as String?,
      noUrut: json['noUrut'] as int?,
      idKelompok: json['idKelompok'] as int?,
      bentuk: json['bentuk'] as String?,
      jenis: json['jenis'] as String?,
    );

Map<String, dynamic> _$ListFormModelToJson(ListFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'identifikasi': instance.identifikasi,
      'noUrut': instance.noUrut,
      'idKelompok': instance.idKelompok,
      'bentuk': instance.bentuk,
      'jenis': instance.jenis,
    };
