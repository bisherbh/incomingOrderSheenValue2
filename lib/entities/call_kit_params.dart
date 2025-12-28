import 'package:json_annotation/json_annotation.dart';

import 'android_params.dart';
import 'ios_params.dart';

part 'call_kit_params.generated.dart';

/// Object config for General - Incoming Order notification.
@JsonSerializable(explicitToJson: true)
class CallKitParams {
  const CallKitParams({
    this.id,
    this.nameCaller,
    this.appName,
    this.avatar,
    this.handle,
    this.type,
    this.duration,
    this.textAccept,
    this.textDecline,
    this.textMissedCall,
    this.textCallback,
    this.extra,
    this.headers,
    this.android,
    this.ios,
  });

  final String? id;

  /// Name to display (e.g., order customer name)
  final String? nameCaller;
  final String? appName;
  final String? avatar;

  /// Additional info to display (e.g., order details)
  final String? handle;
  final double? type;
  final double? duration;

  /// Text for accept button (default: "View Order")
  final String? textAccept;

  /// Text for decline button (default: "Ignore")
  final String? textDecline;

  /// Text for missed order notification (default: "Missed Order")
  final String? textMissedCall;

  /// Text for callback button (default: "View Order")
  final String? textCallback;
  final Map<String, dynamic>? extra;
  final Map<String, dynamic>? headers;
  final AndroidParams? android;
  final IOSParams? ios;

  factory CallKitParams.fromJson(Map<String, dynamic> json) => _$CallKitParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CallKitParamsToJson(this);
}
