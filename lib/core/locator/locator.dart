import 'package:planetx/core/view_model/bottom_nav_model.dart';
import 'package:planetx/modules-new/authentication/view_models/auth_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules-new/authentication/view_models/register_view_model.dart';

///multi-providers as a single child widget
final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
  // ChangeNotifierProvider(create: (_) => AppThemeModel()),
];
