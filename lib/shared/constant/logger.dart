import 'package:logger/logger.dart';
import 'package:logger/web.dart';

enum Level { verbose, debug, info, warning, error, wtf, nothing }

class AppPrettyLogger extends LogPrinter {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      levelColors: {
        Logger.level: AnsiColor.fg(AnsiColor.grey(0)),
      },
      levelEmojis: {
        Logger.level: '📝',
      },
      lineLength: 100,
      colors: true,
      printEmojis: true,
    ),
  );

  @override
  List<String> log(LogEvent event) {
    logger.d(event.message);
    return [];
  }
}
