import 'package:get_it/get_it.dart';
import 'package:oranos/features/home/injection_container.dart' as home;

final sl = GetIt.instance;

void init() {
  home.init();
}
