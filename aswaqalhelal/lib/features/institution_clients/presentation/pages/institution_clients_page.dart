import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/form_inputs/name.dart';
import '../../../../core/form_inputs/phone_number.dart';
import '../../../../core/utils/dialogs.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../bloc/institution_clients_bloc.dart';

class InstitutionClientsPage extends HookWidget {
  const InstitutionClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    final controller = useTextEditingController();
    final nameController = useTextEditingController();
    final focusNode = useFocusNode();
    final bloc = context.read<InstitutionClientsBloc>();

    return BlocListener<InstitutionClientsBloc, InstitutionClientsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case InstitutionClientsStatus.initial:
            break;
          case InstitutionClientsStatus.newPhoneNumberSelected:
            focusNode.unfocus();
            break;
          case InstitutionClientsStatus.newUserSelected:
            focusNode.unfocus();
            nameController.text = state.userProfile.toNullable()!.name;
            break;
          case InstitutionClientsStatus.clientSelectionRemoved:
            focusNode.unfocus();
            controller.clear();
            nameController.clear();
            break;
          case InstitutionClientsStatus.loading:
            showLoadingDialog();
            break;
          case InstitutionClientsStatus.success:
            showSuccessSnackBar(context, 'Client added successfully');
            dismissLoadingDialog();
            break;
          case InstitutionClientsStatus.failure:
            showErrorSnackBar(context, state.errorMessage);
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clients'),
        ),
        body: BlocBuilder<InstitutionClientsBloc, InstitutionClientsState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(18),
              children: [
                AutoSuggestTextField<UserProfile>(
                  controller: controller,
                  focusNode: focusNode,
                  labelText: 'Phone number',
                  suggestions: state.userSuggestions.toList(),
                  suggestionState: state.suggestionState,
                  suggestionBuilder: (context, profile) => ListTile(
                    title: Text(profile.name),
                    subtitle: Text(profile.phoneNumber),
                  ),
                  onSuggestionSelected: (suggestion) => bloc.add(
                    InstitutionClientsEvent.userSelected(
                      userProfile: suggestion,
                    ),
                  ),
                  onEmptyWidgetClicked: () => bloc.add(
                    const InstitutionClientsEvent.newPhoneNumberClicked(),
                  ),
                  onRemoveSelection: () => bloc.add(
                    const InstitutionClientsEvent
                        .removeSelectionButtonClicked(),
                  ),
                  onChanged: (text) => bloc.add(
                    InstitutionClientsEvent.phoneNumberChanged(
                      phoneNumber: text,
                    ),
                  ),
                  errorText: state.phoneNumber.validationMessage(),
                  enabled: state.userProfile.isNone() &&
                      !state.addingNonExistentProfile,
                  showRemoveButton: state.userProfile.isSome() ||
                      state.addingNonExistentProfile,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      enabled: state.addingNonExistentProfile,
                      errorText: state.name.validationMessage()),
                  onChanged: (name) => bloc.add(
                    InstitutionClientsEvent.nameChanged(name: name),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: state.userProfile.isSome() ||
                          (state.phoneNumber.valid && state.name.valid)
                      ? () => bloc.add(
                            InstitutionClientsEvent.addButtonClicked(
                              institutionId: institution.id,
                            ),
                          )
                      : null,
                  child: const Text('Add'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
