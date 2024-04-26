import 'package:easy_work/drawer/custom_drawer_header.dart';
import 'package:easy_work/drawer/custom_list_tile.dart';
import 'package:easy_work/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // elevation: 16.0,
      surfaceTintColor: Colors.white,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomUserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: const Text('L4ru3'),
                accountEmail: const Text('dinglarue@gmail.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage('https://cdn.jsdelivr.net/gh/L4rue/PicGoCDN@master/img/DTB%E9%93%B6.jpg'),
                ),
                onDetailsPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    AnimatedCrossFade(
                      firstChild: Container(),
                      secondChild: Column(
                        children: [
                          CustomListTile(
                            leading: Stack(
                              children: [
                                const CircleAvatar(
                                    backgroundImage: NetworkImage('https://cdn.jsdelivr.net/gh/L4rue/PicGoCDN@master/img/DTB%E9%93%B6.jpg')),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 6.sp,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.check,
                                        size: 10.sp,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
                            ),
                            title: Text('L4rue', style: TextStyle(fontSize: 14.sp)),
                            onTap: () {},
                          ),
                          CustomListTile(
                            leading: const Icon(Icons.add),
                            title: Text('追加账号', style: TextStyle(fontSize: 14.sp)),
                            onTap: () {},
                          ),
                        ],
                      ),
                      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                      sizeCurve: Curves.fastOutSlowIn,
                      crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 200),
                    ),
                    const Divider(height: 0),
                    CustomListTile(
                      leading: const Icon(Icons.fastfood),
                      title: Text(
                        '订餐',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      onTap: () {},
                    ),
                    CustomListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('设置'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: AnimatedSwitcher(
                        duration: Durations.medium1,
                        transitionBuilder: (child, anim) => RotationTransition(
                          turns: child.key == const ValueKey('light_mode')
                              ? Tween<double>(begin: 0, end: 0.25).animate(anim)
                              : Tween<double>(begin: 0.25, end: 0).animate(anim),
                          child: FadeTransition(opacity: anim, child: child),
                        ),
                        child: themeNotifier.value == ThemeMode.light
                            ? const Icon(key: ValueKey('light_mode'), Icons.light_mode)
                            : const Icon(Icons.dark_mode),
                      ),
                      onPressed: () {
                        themeNotifier.value = themeNotifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
                      },
                    ),
                    SizedBox(
                      child: Row(children: [
                        IconButton(
                          icon: const Icon(Icons.power_settings_new),
                          onPressed: () {},
                        ),
                        const Text('退出')
                      ]),
                    )
                  ],
                ),
                onTap: () => Navigator.pop(context),
              ))
        ],
      ),
    );
  }
}
