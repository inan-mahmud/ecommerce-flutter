import 'package:ecommerce_flutter/src/flavors/app_environment.dart';
import 'package:ecommerce_flutter/src/flavors/env_config.dart';

class BuildConfig {
  late final AppEnvironment environment;
  late final EnvConfig config;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required AppEnvironment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }
}
