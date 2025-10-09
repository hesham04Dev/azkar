import 'package:asset_icon/asset_icon.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

import '/db/db.dart';
import '/rootProvider/ThemeProvider.dart';
import '/models/imageIcon.dart';
import '/models/mySwitchTile.dart';
import '/pages/homePage/Bodies/settingBody/Widget/ColorDialog.dart';
import '/pages/homePage/Bodies/settingBody/Widget/MyListTile.dart';
import '/rootProvider/settings_controller.dart';
import '/models/my_toast.dart';


class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    Widget darkModeTile = MySwitchTile(
      title: "الوضع الليلي",
      value: context.read<ThemeProvider>().DarkMode,
      onChange: (bool value) async{
        await AppDatabase.db.settingDao.setDarkMode(value) ;
        context.read<ThemeProvider>().toggleMode();
      },
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          darkModeTile,
          MyListTile(
            title: "اللون الافتراضي",
            trailing: AssetIcon(
               "circle.png",color: context.read<ThemeProvider>().AccentColor,size: 40,
            ),
            onTap: () {
              showDialog(context: context, builder: (context) => const ColorDialog(key: Key("colorDialog"),));
            },
          ),

          MyListTile(
            title: "كود التطبيق",
            trailing: AssetIcon(
              "github.svg",color: context.read<ThemeProvider>().AccentColor,size: 40,
            ),
            onTap: () async {
              // await  launchUrl(Uri.parse('https://github.com/hesham04Dev/AchievementBox'));
            },
          ),

          MyListTile(
            title: 'الاصدار: ${SettingsController.appVersion}',
            onTap: () async{
              if((await AppDatabase.db.settingDao.getEasterEggs()) ==1){
                MyToast(title:const Text("1"),).show(context);
               AppDatabase.db.settingDao.foundEasterEggs();
              }
              
            },
          ),
        ],
      ),
    );
  }
}
