import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../acr_cloud_sdk.dart';

class CustomFileModel {
  /// Response status
  Status? status;

  /// Response metadata
  CustomFileMetadata? metadata;

  String? resultType;
  CustomFileModel({
    this.status,
    this.metadata,
    this.resultType,
  });

  CustomFileModel copyWith({
    Status? status,
    CustomFileMetadata? metadata,
    String? resultType,
  }) {
    return CustomFileModel(
      status: status ?? this.status,
      metadata: metadata ?? this.metadata,
      resultType: resultType ?? this.resultType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status!.toJson()});
    }
    if (metadata != null) {
      result.addAll({'metadata': metadata!.toMap()});
    }
    if (resultType != null) {
      result.addAll({'result_type': resultType});
    }

    return result;
  }

  factory CustomFileModel.fromMap(Map<String, dynamic> map) {
    return CustomFileModel(
      status: map['status'] != null
          ? Status.fromJson(
              map['status'],
            )
          : null,
      metadata: map['metadata'] != null
          ? CustomFileMetadata.fromMap(map['metadata'])
          : null,
      resultType: map['result_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomFileModel.fromJson(String source) =>
      CustomFileModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomFileModel(status: $status, metadata: $metadata, resultType: $resultType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomFileModel &&
        other.status == status &&
        other.metadata == metadata &&
        other.resultType == resultType;
  }

  @override
  int get hashCode => status.hashCode ^ metadata.hashCode ^ resultType.hashCode;
}

class CustomFileMetadata {
  /// Custom uploaded file fields
  Map<String, dynamic>? customFiles;

  /// ACRCloud unique identifier
  String? acrid;

  /// File name
  String? title;

  /// User defined identifier
  String? audioId;

  String? timestampUtc;
  CustomFileMetadata({
    this.customFiles,
    this.acrid,
    this.title,
    this.audioId,
    this.timestampUtc,
  });

  CustomFileMetadata copyWith({
    Map<String, dynamic>? customFiles,
    String? acrid,
    String? title,
    String? audioId,
    String? timestampUtc,
  }) {
    return CustomFileMetadata(
      customFiles: customFiles ?? this.customFiles,
      acrid: acrid ?? this.acrid,
      title: title ?? this.title,
      audioId: audioId ?? this.audioId,
      timestampUtc: timestampUtc ?? this.timestampUtc,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (customFiles != null) {
      result.addAll({'custom_files': customFiles});
    }
    if (acrid != null) {
      result.addAll({'acrid': acrid});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (audioId != null) {
      result.addAll({'audio_id': audioId});
    }
    if (timestampUtc != null) {
      result.addAll({'timestamp_utc': timestampUtc});
    }

    return result;
  }

  factory CustomFileMetadata.fromMap(Map<String, dynamic> map) {
    return CustomFileMetadata(
      customFiles: Map<String, dynamic>.from(map['custom_files']),
      acrid: map['acrid'],
      title: map['title'],
      audioId: map['audio_id'],
      timestampUtc: map['timestamp_utc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomFileMetadata.fromJson(String source) =>
      CustomFileMetadata.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomFileMetadata(customFiles: $customFiles, acrid: $acrid, title: $title, audioId: $audioId, timestampUtc: $timestampUtc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomFileMetadata &&
        mapEquals(other.customFiles, customFiles) &&
        other.acrid == acrid &&
        other.title == title &&
        other.audioId == audioId &&
        other.timestampUtc == timestampUtc;
  }

  @override
  int get hashCode {
    return customFiles.hashCode ^
        acrid.hashCode ^
        title.hashCode ^
        audioId.hashCode ^
        timestampUtc.hashCode;
  }
}
