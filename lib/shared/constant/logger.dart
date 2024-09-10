import 'package:logger/logger.dart';
import 'package:logger/web.dart';

enum Level { verbose, debug, info, warning, error, wtf, nothing }

class AppPrettyLogger extends LogPrinter {
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 5,
      levelColors: {
        Logger.level: AnsiColor.fg(AnsiColor.grey(0)),
      },
      lineLength: 120,
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
