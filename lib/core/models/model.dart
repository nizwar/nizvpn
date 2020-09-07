/*
 * Copyright (c) 2020 Mochamad Nizwar Syafuan
 * Distributed under the GNU GPL v2 with additional terms. For full terms see the file doc/LICENSE.txt
 */

abstract class Model {
  Map<String, dynamic> toJson();
  String toString() => toJson().toString();
}
