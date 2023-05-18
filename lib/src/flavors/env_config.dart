import 'package:ecommerce_flutter/src/core/config/app_values.dart';
import 'package:logger/logger.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: AppValues.loggerMethodCount,
        errorMethodCount: AppValues.loggerErrorMethodCount,
        lineLength: AppValues.loggerLineLength,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );
  }
}
