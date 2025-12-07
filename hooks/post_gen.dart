import 'dart:io';
import 'package:mason/mason.dart';

Future<void> _run(String cmd, List<String> args, HookContext context) async {
  final result = await Process.run(cmd, args);

  if (result.exitCode != 0) {
    context.logger.err('Error running: $cmd ${args.join(" ")}');
    context.logger.err(result.stderr.toString());
  } else {
    context.logger.info('✔️ ${cmd} ${args.join(" ")}');
  }
}

void run(HookContext context) async {
  context.logger.info('Adding dependencies...');

  /// -------------------------------
  /// Normal Dependencies
  /// -------------------------------
  final deps = [
    'bloc',
    'equatable',
    'http',
    'get_it',
    'go_router',
    'fpdart',
    'flutter_launcher_icons',
    'bloc_lint',
  ];

  /// -------------------------------
  /// Dev Dependencies
  /// -------------------------------
  final devDeps = [
    'bloc_test',
    'mocktail',
  ];

  // Add dependencies
  for (final dep in deps) {
    await _run('flutter', ['pub', 'add', dep], context);
  }

  // Add dev dependencies
  for (final dep in devDeps) {
    await _run('flutter', ['pub', 'add', '--dev', dep], context);
  }

  context.logger.success('All dependencies installed successfully!');
}
