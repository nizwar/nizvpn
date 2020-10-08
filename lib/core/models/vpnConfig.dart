/*
 * Copyright (c) 2020 Mochamad Nizwar Syafuan
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

import 'package:flutter/material.dart';

import 'model.dart';

class VpnConfig extends Model {
  VpnConfig({
    @required this.name,
    this.username,
    this.password,
    @required this.config,
  });

  String name;
  String username;
  String password;
  String config;

  factory VpnConfig.fromJson(Map<String, dynamic> json) => VpnConfig(
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        config: json["config"] == null ? null : json["config"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "config": config == null ? null : config,
      };
}
