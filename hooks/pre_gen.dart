import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final featuresDir = Directory('lib/features');
  if (!await featuresDir.exists()) {
    await featuresDir.create(recursive: true);
    context.logger.info('Created folder lib/features');
  }
}
