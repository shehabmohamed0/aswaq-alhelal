import 'package:flutter/material.dart';


class SelectDialog<T> extends StatelessWidget {
  const SelectDialog(
      {Key? key, required this.choises, required this.itemBuilder})
      : super(key: key);
  final List<T> choises;
  final SelectWidget<T> Function(T item) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: choises.length,
      itemBuilder: (context, index) {
        return itemBuilder(choises[index]);
      },
    );
  }
}

class SelectWidget<T> extends StatelessWidget {
  const SelectWidget({
    Key? key,
    required this.title,
    required this.onSelect,
  }) : super(key: key);
  final String title;
  final Function() onSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      color: Colors.grey.shade100,
      child: ListTile(
        title: Text(title),
        onTap: () {
          onSelect();
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }
}
