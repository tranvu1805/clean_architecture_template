import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

Future<void> run(HookContext context) async {
  _setProjectName(context);
  await _ensureFeaturesFolder(context);
}

void _setProjectName(HookContext context) {
  final pubspecFile = File('pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    context.logger.err('pubspec.yaml not found');
    exit(1);
  }

  final yaml = loadYaml(pubspecFile.readAsStringSync());
  final projectName = yaml['name'];

  if (projectName == null) {
    context.logger.err('Cannot find project name in pubspec.yaml');
    exit(1);
  }

  context.vars['project_name'] = projectName;
}

Future<void> _ensureFeaturesFolder(HookContext context) async {
  final featuresDir = Directory('lib/features');

  if (!await featuresDir.exists()) {
    await featuresDir.create(recursive: true);
    context.logger.info('Created folder lib/features');
  }
}
