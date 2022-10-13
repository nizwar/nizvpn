/*
 * Copyright (c) 2020 Mochamad Nizwar Syafuan
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

import 'model.dart';

class VpnStatus extends Model {
  VpnStatus({
    this.duration,
    this.lastPacketReceive,
    this.byteIn,
    this.byteOut,
  });

  String? duration;
  String? lastPacketReceive;
  String? byteIn;
  String? byteOut;

  factory VpnStatus.fromJson(Map<String, dynamic> json) => VpnStatus(
        duration: json["duration"],
        lastPacketReceive: json["last_packet_receive"],
        byteIn: json["byte_in"],
        byteOut: json["byte_out"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "last_packet_receive": lastPacketReceive,
        "byte_in": byteIn,
        "byte_out": byteOut,
      };
}
