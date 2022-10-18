import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

import '../../../../domain/entities/employee.dart';

class EmployeeListTile extends StatelessWidget {
  const EmployeeListTile({Key? key, required this.employee}) : super(key: key);
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.2),
              blurRadius: 2,
            )
          ]),
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (employee.name != null) Text(employee.name!),
            Text(employee.phoneNumber),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(employee.role),
            Text(format(employee.creationTime)),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
