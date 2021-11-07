import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/My_Theme_Data.dart';
import 'package:to_do_app/Provider/AppConfigProvider.dart';

class Todo_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          onTap: () {},
        )
      ],
      child: Container(
        height: 120,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: provider.isDarkMode()
                ? Color.fromARGB(255, 20, 25, 34)
                : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 62,
              margin: EdgeInsets.symmetric(vertical: 12),
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    AppLocalizations.of(context)!.subtitle,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset('assets/image/ic_check.png'),
            )
          ],
        ),
      ),
    );
  }
}
