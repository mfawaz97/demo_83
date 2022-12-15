import 'package:demo_83/util/constants.dart';
import 'package:demo_83/util/injectables/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(usesNullSafety: false)
Future<void> configureInjection(DevMode env) async {
  $initGetIt(getIt);
}
