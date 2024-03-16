import 'package:json_annotation/json_annotation.dart';

part 'list_group_model.g.dart';

@JsonSerializable()
class ListGroupResponse {
  final List<ListGroupModel>? data;

  ListGroupResponse({this.data});

  factory ListGroupResponse.fromJson(Map<String, dynamic> json) => _$ListGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListGroupResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListGroupModel {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final String? name;
  final String? nikKader;
  final String? noKader;
  final String? kodeRtKelompok;
  final int? bangunanTarget;
  final int? krtTarget;
  final int? keluargaTarget;
  final int? individuTarget;
  final String? kodeLurahCapil;
  final String? namaKader;
  final String? labelRt;
  final String? labelRw;

  ListGroupModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.name,
    this.nikKader,
    this.noKader,
    this.kodeRtKelompok,
    this.bangunanTarget,
    this.krtTarget,
    this.keluargaTarget,
    this.individuTarget,
    this.kodeLurahCapil,
    this.namaKader,
    this.labelRt,
    this.labelRw,
  });

  factory ListGroupModel.fromJson(Map<String, dynamic> json) => _$ListGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListGroupModelToJson(this);
}
