/*import 'package:flutter/material.dart';

class settingBody extends StatefulWidget {
  const settingBody({Key? key}) : super(key: key);

  @override
  State<settingBody> createState() => _settingBodyState();
}

class _settingBodyState extends State<settingBody> {
  bool _darkMode = false;
  bool _darkMode2 = false;
  bool _notification = false;

  TimeOfDay? sabahNotificationTime = null;
  TimeOfDay? masaNotificationTime = null;
  String fontName = "joz";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 20,
        ),
        SwitchListTile(
          value: _darkMode,
          onChanged: (value) {
            setState(() {
              _darkMode = value as bool;
              print(value);
            });
          },
          title: Text("الوضع المظلم"),
        ),
        SwitchListTile(
          value: _darkMode2,
          onChanged: (value) {
            setState(() {
              _darkMode2 = value as bool;
              print(value);
            });
          },
          title: Text("الوضع المظلم"),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "نوع الخط",
                style: TextStyle(fontSize: 16),
              )),
              TextButton(
                onPressed: () {
                  if (fontName == "joz") {
                    fontName = "taj";
                  } else {
                    fontName = "joz";
                  }
                  setState(() {});
                },
                child: Text(fontName == "joz" ? "جذور" : "تجوال"),
              )
            ],
          ),
        ),
        SwitchListTile(
          value: _notification,
          onChanged: (value) {
            setState(() {
              _notification = value as bool;
              print(value);
              if (value) {}
            });
          },
          title: Text("تفعيل الإشعارات"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Visibility(
            visible: _notification,
            child: //Text(notifcationTime == null?"اختر وقتا" : notifcationTime.toString()),
                Row(
              children: [
                Expanded(child: Text("اشعار اذكار الصباح")),
                TextButton(
                    onPressed: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now()).then(
                        (value) {
                          setState(() {
                            sabahNotificationTime = value as TimeOfDay;
                          });
                        },
                      );
                    },
                    child: Text(sabahNotificationTime == null?"اختر وقتا" : sabahNotificationTime!.format(context)))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Visibility(
            visible: _notification,
            child: //Text(notifcationTime == null?"اختر وقتا" : notifcationTime.toString()),
            Row(
              children: [
                Expanded(child: Text("اشعار اذكار المساء")),
                TextButton(
                    onPressed: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now(),
                      ).then((value) {
                       setState(() {
                         masaNotificationTime = value as TimeOfDay;
                       });

                      });

                    },
                    child: Text(masaNotificationTime == null?"اختر وقتا" : masaNotificationTime!.format(context)))
              ],
            ),
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.grey,
          endIndent: 20,
          indent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
*/