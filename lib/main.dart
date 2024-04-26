import 'package:easy_work/drawer/custom_drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      preLoad(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (_, ThemeMode currentMode, __) {
            return MaterialApp(
              theme: _lightTheme(),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              themeMode: currentMode,
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Easy Work'),
                ),
                body: Container(
                  child: Text('Easy Work'),
                ),
                drawer: CustomDrawer(),
                drawerDragStartBehavior: DragStartBehavior.start,
                drawerEdgeDragWidth: MediaQuery.sizeOf(context).width / 2,
              ),
            );
            ;
          },
        );
      },
    );
  }
}

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

_lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    // 主题色
    primaryColor: const Color.fromRGBO(58, 162, 217, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(58, 162, 217, 1),
    ),
  );
}

/// Pre load for online resourse
/// 预加载网络资源
preLoad(BuildContext context) {
  // NetworkImage
  precacheImage(const NetworkImage('https://cdn.jsdelivr.net/gh/L4rue/PicGoCDN@master/img/DTB%E9%93%B6.jpg'), context);
}
