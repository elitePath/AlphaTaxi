import 'package:alpha_taxi/bloc/location/index.dart';
import 'package:flutter/material.dart';


class MainBloc with
    ChangeNotifier,
    LocationBloc{
  String _bearerToken;

  String get bearerToken {
    return _bearerToken;
  }

  set bearerToken(token) {
    _bearerToken = token;
  }

}