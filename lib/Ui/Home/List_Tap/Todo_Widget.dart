import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Provider/AppConfigProvider.dart';
import 'package:to_do_app/data/FireStoreUtils.dart';
import 'package:to_do_app/data/Todo.dart';

class Todo_Widget extends StatefulWidget {
  Todo item;

  Todo_Widget(this.item);

  @override
  State<Todo_Widget> createState() => _Todo_WidgetState();
}

class _Todo_WidgetState extends State<Todo_Widget> {
  bool isDone = false;

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
                  AppLocalizations.of(context)!.delete,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          onTap: () {
            deleteTodo(widget.item)
                .then((value) {
                  Fluttertoast.showToast(
                      msg: "task deleted successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                      fontSize: 16.0);
                })
                .onError((error, stackTrace) {})
                .timeout(Duration(seconds: 10), onTimeout: () {});
          },
        )
      ],
      child: Container(
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
              height: 70,
              margin: EdgeInsets.symmetric(vertical: 12),
              color: provider.isDone(isDone)
                  ? Colors.green
                  : Theme.of(context).primaryColor,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.item.title,
                    style: provider.isDone(isDone)
                        ? Theme.of(context).textTheme.headline3
                        : Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    widget.item.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )),
            InkWell(
                onTap: () {
                  setState(() {
                    if (isDone == false) {
                      isDone = true;
                    }
                  });
                },
                child: provider.isDone(isDone)
                    ? Text(
                        'Done!',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )
                    : Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            color: provider.isDone(isDone)
                                ? Colors.green
                                : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          'assets/image/ic_check.png',
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
