import 'package:flutter/material.dart';

extension XTimeOfDay on TimeOfDay {
  String toSerialize() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:00';
  }
}
