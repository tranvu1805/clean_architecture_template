import 'dart:io';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages...');

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

  final devDeps = [
    'bloc_test',
    'mocktail',
  ];

  for (final dep in deps) {
    await _run('flutter', ['pub', 'add', dep], context);
  }

  for (final dep in devDeps) {
    await _run('flutter', ['pub', 'add', '--dev', dep], context);
  }

  progress.complete();
  context.logger.success('All dependencies installed successfully!');
}

Future<void> _run(String cmd, List<String> args, HookContext context) async {
  final result = await Process.run(cmd, args, runInShell: true);

  if (result.exitCode != 0) {
    context.logger.err('Failed: $cmd ${args.join(" ")}');
    context.logger.err(result.stderr.toString());
  } else {
    context.logger.info('$cmd ${args.join(" ")}');
  }
}
