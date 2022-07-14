import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:root_package/core/resources/values_manager.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';
import 'package:root_package/widgets/international_phone_text_field.dart';

import '../../../../l10n/l10n.dart';
import '../../../auth/bloc/app_status/app_bloc.dart';

class PhoneInfoPage extends HookWidget {
  const PhoneInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = locator<UsersPresentationLocalizations>();
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(intl.phoneInfo),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              InternationalPhoneTextField(
                countries: const ['EG'],
                initialNumber: user.phoneNumber,
                errorText: () => null,
                isEnabled: false,
                onInputChanged: (d) {},
              ),
              const SizedBox(height: 8),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.updatePhone);
                      },
                      child: Text(intl.change)))
            ],
          ),
        ),
      ),
    );
  }
}

class GenderRadio extends StatelessWidget {
  const GenderRadio({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String?>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(title, style: Theme.of(context).textTheme.titleSmall!)
      ],
    );
  }
}

class SettingsTextFormField extends StatelessWidget {
  const SettingsTextFormField({
    Key? key,
    this.controller,
    required this.labelText,
     this.errorText,
    this.onChanged,
    this.initialValue,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final String? initialValue;
  final bool enabled;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor)),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Theme.of(context).primaryColor,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          iconColor: Theme.of(context).primaryColor,
        ),
      ),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        enabled: enabled,
        onChanged: onChanged,
        readOnly: !enabled,
        cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppSize.s18,
            color: enabled ? Colors.black87 : Colors.black45),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          errorText: errorText,
          labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.s14,
          ),
        ),
      ),
    );
  }
}
