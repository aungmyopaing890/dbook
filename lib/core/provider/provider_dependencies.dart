import 'package:dbook/core/db/database_helper.dart';
import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/repository/banner_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../api/master_api_service.dart';
import '../db/master_shared_preferences.dart';

import '../viewobject/common/master_value_holder.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<MasterSharedPreferences>.value(
      value: MasterSharedPreferences.instance),
  Provider<MasterApiService>.value(value: MasterApiService()),
  Provider<DatabaseHelper>.value(value: DatabaseHelper.instance),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  ProxyProvider<DatabaseHelper, AuthRepository>(
    update: (_, DatabaseHelper databaseHelper, AuthRepository? repository) =>
        AuthRepository(
      db: databaseHelper,
    ),
  ),
  ProxyProvider<MasterApiService, BookRepository>(
    update: (_, MasterApiService apiService, BookRepository? repository) =>
        BookRepository(
      apiService: apiService,
    ),
  ),
];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[
  StreamProvider<MasterValueHolder?>(
    initialData: null,
    create: (BuildContext context) =>
        Provider.of<MasterSharedPreferences>(context, listen: false)
            .masterValueHolder,
  )
];
