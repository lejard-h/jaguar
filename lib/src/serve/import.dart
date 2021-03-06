library jaguar.src.serve;

import 'dart:async';
import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:logging/logging.dart';

import 'package:jaguar/src/serve/error_writer/import.dart';

import 'package:args/args.dart';
import 'package:yaml/yaml.dart';

part 'config.dart';
part 'server.dart';
part 'settings.dart';

///Serves the API with given configuration [configuration]
Future<Null> serve(Configuration configuration) async {
  Jaguar j = new Jaguar(configuration);
  await j.serve();
}
