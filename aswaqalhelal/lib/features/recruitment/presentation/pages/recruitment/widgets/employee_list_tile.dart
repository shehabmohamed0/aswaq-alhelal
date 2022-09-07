import 'package:flutter/material.dart';

import '../../../../domain/entities/employee.dart';

class EmployeeListTile extends StatelessWidget {
  const EmployeeListTile({Key? key, required this.employee}) : super(key: key);
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.comfortable,
      title: Text(employee.name?? 'null'),
      subtitle: Text(employee.role),
      onTap: () {},
    );
  }
}
