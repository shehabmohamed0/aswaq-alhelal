import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/form_inputs/phone_number.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../bloc/institution_clients_bloc.dart';

class InstitutionClientsPage extends HookWidget {
  const InstitutionClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final institution =
    //     ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    final controller = useTextEditingController();
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
            break;
          case InstitutionClientsStatus.clientSelectionRemoved:
            focusNode.unfocus();
            controller.clear();
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clients'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
                child: BlocBuilder<InstitutionClientsBloc,
                    InstitutionClientsState>(
                  builder: (context, state) {
                    return AutoSuggestTextField<UserProfile>(
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
                      enabled: !state.userProfile.valid &&
                          !state.isAddingClientWithoutUserProfile,
                      showRemoveButton: state.userProfile.valid ||
                          state.isAddingClientWithoutUserProfile,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
