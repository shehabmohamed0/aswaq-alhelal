import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:root_package/packages/flutter_hooks.dart';

import '../../../auth/domain/entities/institution_profile.dart';

class InstitutionClientsPage extends HookWidget {
  const InstitutionClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final institution =
        ModalRoute.of(context)!.settings.arguments as InstitutionProfile;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

// class NewWidget<T> extends StatefulWidget {
//   const NewWidget({
//     Key? key,
//     required this.controller,
//     this.focusNode,
//     required this.suggestionsCallback,
//     required this.itemBuilder,
//     this.noItemsFoundBuilder,
//     required this.minCharsForSuggestions,
//     required this.onSuggestionSelected,
//     this.debounceDuration = const Duration(milliseconds: 300),
//     this.enabled = true,
//     this.showRemoveButton = true,
//     required this.onRemoveButtonClicked,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final FocusNode? focusNode;
//   final FutureOr<Iterable<T>> Function(String pattern) suggestionsCallback;
//   final Widget Function(BuildContext context, T suggestion) itemBuilder;
//   final Widget Function(BuildContext context)? noItemsFoundBuilder;
//   final int minCharsForSuggestions;
//   final Duration debounceDuration;
//   final void Function(T suggestion) onSuggestionSelected;
//   final bool enabled;
//   final bool showRemoveButton;
//   final VoidCallback onRemoveButtonClicked;

//   @override
//   State<NewWidget<T>> createState() => _NewWidgetState<T>();
// }

// class _NewWidgetState<T> extends State<NewWidget<T>> {
//   final SuggestionsBoxController _suggestionsBoxController =
//       SuggestionsBoxController();

//   @override
//   void initState() {
//     super.initState();
//     widget.focusNode?.addListener(() {
//       if (widget.focusNode?.hasFocus ?? false) {
//         if (!_suggestionsBoxController.isOpened()) {
//           _suggestionsBoxController.open();
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AbsorbPointer(
//           absorbing: !widget.enabled,
//           child: TypeAheadField<T>(
//             suggestionsBoxController: _suggestionsBoxController,
//             suggestionsCallback: widget.suggestionsCallback,
//             minCharsForSuggestions: widget.minCharsForSuggestions,
//             debounceDuration: widget.debounceDuration,
//             noItemsFoundBuilder: widget.noItemsFoundBuilder,
//             keepSuggestionsOnLoading: false,
//             textFieldConfiguration: TextFieldConfiguration(
//               controller: widget.controller,
//               focusNode: widget.focusNode,
//               enabled: widget.enabled,
//               decoration: InputDecoration(
//                 filled: !widget.enabled,
//                 fillColor: widget.enabled ? null : Colors.grey.shade100,
//               ),
//             ),
//             itemBuilder: widget.itemBuilder,
//             onSuggestionSelected: widget.onSuggestionSelected,
//             loadingBuilder: (context) => const ListTile(
//               title: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 alignment: AlignmentDirectional.centerStart,
//                 child: SizedBox.square(
//                   dimension: 28,
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         if (!widget.enabled && widget.showRemoveButton)
//           PositionedDirectional(
//             bottom: 1,
//             end: 8,
//             top: 1,
//             child: GestureDetector(
//               onTap: widget.onRemoveButtonClicked,
//               child: const Icon(
//                 Icons.close_rounded,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
