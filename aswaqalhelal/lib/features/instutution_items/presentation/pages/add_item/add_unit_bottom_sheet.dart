import 'package:flutter/material.dart';

import '../../../domain/entities/unit.dart';

class AddUnitBottomSheet extends StatefulWidget {
  const AddUnitBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddUnitBottomSheet> createState() => _AddUnitBottomSheetState();
}

class _AddUnitBottomSheetState extends State<AddUnitBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Unit name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                controller: nameController,
                validator: (s) {
                  if (s != null) {
                    if (s.isEmpty) {
                      return 'Required';
                    }
                    if (s.trim().length <= 2) {
                      return 'Must be at least 2 characters';
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 8),
              Text(
                'Quantity',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                controller: quantityController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                validator: _numberValidator,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 8),
              Text(
                'Price',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                validator: _numberValidator,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    Navigator.of(context).pop(
                      Unit(
                        name: nameController.text,
                        quantity: double.parse(quantityController.text),
                        price: double.parse(priceController.text),
                      ),
                    );
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _numberValidator(s) {
    if (s != null) {
      final quantity = double.tryParse(s);
      if (quantity == null) {
        return 'invalid';
      }
    }
    return null;
  }
}
