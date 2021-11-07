import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/My_Theme_Data.dart';
import 'package:to_do_app/Provider/AppConfigProvider.dart';

class AddTodoWidget extends StatefulWidget {
  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode()
          ? MyThemeData.darkScaffildBackground
          : Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.addnewask,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          provider.isDarkMode() ? Colors.white : Colors.black)),
              fillColor: provider.isDarkMode()
                  ? MyThemeData.darkScaffildBackground
                  : Colors.white,
              labelText: AppLocalizations.of(context)!.title,
              labelStyle: Theme.of(context).textTheme.headline2,
            ),
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: provider.isDarkMode()
                            ? Colors.white
                            : Colors.black)),
                fillColor: provider.isDarkMode()
                    ? MyThemeData.darkScaffildBackground
                    : Colors.white,
                labelText: AppLocalizations.of(context)!.description,
                labelStyle: Theme.of(context).textTheme.headline2),
            maxLines: 4,
            minLines: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.date,
              style: TextStyle(
                color: provider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
          ),
          InkWell(
            onTap: () => showDateDialge(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '1/12/2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: provider.isDarkMode() ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.add,
            ),
          )
        ],
      ),
    );
  }

  void showDateDialge() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
