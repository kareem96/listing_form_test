// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      id: json['id'] as int?,
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

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
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
