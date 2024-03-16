// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGroupResponse _$ListGroupResponseFromJson(Map<String, dynamic> json) =>
    ListGroupResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListGroupResponseToJson(ListGroupResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ListGroupModel _$ListGroupModelFromJson(Map<String, dynamic> json) =>
    ListGroupModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      name: json['name'] as String?,
      nikKader: json['nikKader'] as String?,
      noKader: json['noKader'] as String?,
      kodeRtKelompok: json['kodeRtKelompok'] as String?,
      bangunanTarget: json['bangunanTarget'] as int?,
      krtTarget: json['krtTarget'] as int?,
      keluargaTarget: json['keluargaTarget'] as int?,
      individuTarget: json['individuTarget'] as int?,
      kodeLurahCapil: json['kodeLurahCapil'] as String?,
      namaKader: json['namaKader'] as String?,
      labelRt: json['labelRt'] as String?,
      labelRw: json['labelRw'] as String?,
    );

Map<String, dynamic> _$ListGroupModelToJson(ListGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'name': instance.name,
      'nikKader': instance.nikKader,
      'noKader': instance.noKader,
      'kodeRtKelompok': instance.kodeRtKelompok,
      'bangunanTarget': instance.bangunanTarget,
      'krtTarget': instance.krtTarget,
      'keluargaTarget': instance.keluargaTarget,
      'individuTarget': instance.individuTarget,
      'kodeLurahCapil': instance.kodeLurahCapil,
      'namaKader': instance.namaKader,
      'labelRt': instance.labelRt,
      'labelRw': instance.labelRw,
    };
