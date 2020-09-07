/*
 * Copyright (c) 2020 Mochamad Nizwar Syafuan
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/vpnStatus.dart';
import '../models/vpnConfig.dart';

class NizVpn {
  ///Channel to native
  static final String _eventChannelVpnStage = "id.nizwar.nvpn/vpnstage";
  static final String _eventChannelVpnStatus = "id.nizwar.nvpn/vpnstatus";
  static final String _methodChannelVpnControl = "id.nizwar.nvpn/vpncontrol";

  ///Snapshot of VPN Connection Stage
  static Stream<String> vpnStageSnapshot() => EventChannel(_eventChannelVpnStage).receiveBroadcastStream().cast();

  ///Snapshot of VPN Connection Status
  static Stream<VpnStatus> vpnStatusSnapshot() => EventChannel(_eventChannelVpnStatus).receiveBroadcastStream().map((event) => VpnStatus.fromJson(jsonDecode(event))).cast();

  ///Start VPN easily
  static Future<void> startVpn(VpnConfig vpnConfig) {
    return MethodChannel(_methodChannelVpnControl).invokeMethod(
      "start",
      {
        "config": vpnConfig.config,
        "country": vpnConfig.name,
        "username": vpnConfig.username ?? "",
        "password": vpnConfig.password ?? "",
      },
    );
  }

  ///Stop vpn
  static Future<void> stopVpn() => MethodChannel(_methodChannelVpnControl).invokeMethod("stop");

  ///Trigger native to get send stage connection
  static Future<void> refreshStage() => MethodChannel(_methodChannelVpnControl).invokeMethod("refresh");

  ///Get latest stage
  static Future<String> stage() => MethodChannel(_methodChannelVpnControl).invokeMethod("status");

  ///Check if vpn is connected
  static Future<bool> isConnected() => stage().then((value) => value.toLowerCase() == "connected");

  ///All Stages of connection
  static const String vpnConnected = "connected";
  static const String vpnDisconnected = "disconnected";
  static const String vpnWaitConnection = "wait_connection";
  static const String vpnAuthenticating = "authenticating";
  static const String vpnReconnect = "reconnect";
  static const String vpnNoConnection = "no_connection";
  static const String vpnConnecting = "connecting";
  static const String vpnPrepare = "prepare";
  static const String vpnDenied = "denied";
}
