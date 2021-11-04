import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/functions/map_to_list_url.dart';
import 'package:untitled/provider/dogs.dart';

import '../api/request.dart';
import '../functions/map_to_list.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: _buildBody(context),
        ),
      );
  }

  Widget _buildBody(BuildContext context) {
    final client = ApiRequest(Dio(BaseOptions(contentType: "application/json")),
        baseUrl: 'https://dog.ceo/api/');
    Future _future = client.getDogList();
    _future.then((value) {
      Provider.of<DOGS>(context, listen: false).allNames = mapToList(value.message);
      mapToListUrl(value.message, context);
//      Navigator.of(MaterialApp).pushReplacementNamed(context, '/home');
      Navigator.pushReplacementNamed(context, '/home');
    });
    return const CircularProgressIndicator();
  }
}