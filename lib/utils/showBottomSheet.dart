import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:hive_flutter/adapters.dart';

void showLanguageBottomSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ValueListenableBuilder(
        valueListenable: Hive.box('languageBox').listenable(),
        builder: (context, box, child) {
          String language = box.get('language', defaultValue: 'en');
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.languageTitle,
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 15,
                ),
                Text(AppLocalizations.of(context)!.languageSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.8,
                  color: Theme.of(context).iconTheme.color!,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: RadioListTile<String>.adaptive(
                            title: Text('English'),
                            value: 'en',
                            groupValue: language,
                            onChanged: (value) {
                              if (value != null) {
                                box.put('language', value);
                              }
                              Navigator.pop(context);
                            },
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: RadioListTile<String>.adaptive(
                            title: Text('العربية'),
                            value: 'ar',
                            groupValue: language,
                            onChanged: (value) {
                              if (value != null) {
                                box.put('language', value);
                              }
                              Navigator.pop(context);
                            },
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}