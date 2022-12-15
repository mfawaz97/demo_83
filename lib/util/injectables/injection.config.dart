// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
// ignore: no_leading_underscores_for_library_prefixes
import 'package:injectable/injectable.dart' as _i2;

// ignore: no_leading_underscores_for_library_prefixes
// ignore: no_leading_underscores_for_library_prefixes
import 'injectable.variables.dart' as _i4;
// ignore: no_leading_underscores_for_library_prefixes
import 'services.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.InjectableServices>(_i3.InjectableServices());
  gh.singleton<_i4.InjectableVariables>(_i4.InjectableVariables());
  return get;
}
