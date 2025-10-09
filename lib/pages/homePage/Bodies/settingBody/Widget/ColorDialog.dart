
import 'package:asset_icon/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/db/db.dart';
import '/config/colors.dart';
import '/models/imageIcon.dart';
import '/rootProvider/ThemeProvider.dart';

class ColorDialog extends StatelessWidget {
  const ColorDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 155,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemBuilder: (context, index) => IconButton(
                    onPressed: () async{
                      await AppDatabase.db.settingDao.setAccentColor(index);
                      context
                          .read<ThemeProvider>()
                          .accentColorChanged(colors[index]);

                      Navigator.pop(context);
                    },
                    icon: AssetIcon(
                      "circle.png",
                      size: 40,
                      color: colors[index],
                    ),
                  ),
              itemCount: colors.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  mainAxisExtent: 50,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4)),
        ),
      ),
    );
    
  }
}
