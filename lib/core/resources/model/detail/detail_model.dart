
import 'package:json_annotation/json_annotation.dart';
part 'detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailModel {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? createdBy;
  final String? updatedBy;
  final String? identifikasi;
  final int? noUrut;
  final int? idKelompok;
  final String? bentuk;
  final String? jenis;

  DetailModel({
    this.id,
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

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}