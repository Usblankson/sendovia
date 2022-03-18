import 'package:planetx/core/view_model/bottom_nav_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

///multi-providers as a single child widget
final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  // ChangeNotifierProvider(create: (_) => AppThemeModel()),
];
