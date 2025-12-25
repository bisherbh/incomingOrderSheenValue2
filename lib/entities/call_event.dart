/// Object for Order notification events.
class CallEvent {
  Event event;
  dynamic body;

  CallEvent(this.body, this.event);
  @override
  String toString() => 'CallEvent( body: $body, event: $event)';
}

/// Events for incoming order notifications
enum Event {
  ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP,

  /// Received an incoming order notification
  ACTION_CALL_INCOMING,

  /// Started viewing an order
  ACTION_CALL_START,

  /// Accepted/viewed an incoming order
  ACTION_CALL_ACCEPT,

  /// Declined/ignored an incoming order
  ACTION_CALL_DECLINE,

  /// Ended an order session
  ACTION_CALL_ENDED,

  /// Missed an incoming order (timeout)
  ACTION_CALL_TIMEOUT,

  /// Clicked to view order from missed notification (Android only)
  ACTION_CALL_CALLBACK,
  ACTION_CALL_TOGGLE_HOLD,
  ACTION_CALL_TOGGLE_MUTE,
  ACTION_CALL_TOGGLE_DMTF,
  ACTION_CALL_TOGGLE_GROUP,
  ACTION_CALL_TOGGLE_AUDIO_SESSION,
}

/// Using extension for backward compatibility Dart SDK 2.17.0 and lower
extension EventX on Event {
  String get name {
    switch (this) {
      case Event.ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP:
        return 'com.hiennv.flutter_callkit_incoming.DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP';
      case Event.ACTION_CALL_INCOMING:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_INCOMING';
      case Event.ACTION_CALL_START:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_START';
      case Event.ACTION_CALL_ACCEPT:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_ACCEPT';
      case Event.ACTION_CALL_DECLINE:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_DECLINE';
      case Event.ACTION_CALL_ENDED:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_ENDED';
      case Event.ACTION_CALL_TIMEOUT:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TIMEOUT';
      case Event.ACTION_CALL_CALLBACK:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_CALLBACK';
      case Event.ACTION_CALL_TOGGLE_HOLD:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_HOLD';
      case Event.ACTION_CALL_TOGGLE_MUTE:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_MUTE';
      case Event.ACTION_CALL_TOGGLE_DMTF:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_DMTF';
      case Event.ACTION_CALL_TOGGLE_GROUP:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_GROUP';
      case Event.ACTION_CALL_TOGGLE_AUDIO_SESSION:
        return 'com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_AUDIO_SESSION';
    }
  }
}
