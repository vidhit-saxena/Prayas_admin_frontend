import 'package:flutter/material.dart';

class ProcurementScreen extends StatefulWidget {
  @override
  _ProcurementScreenState createState() => _ProcurementScreenState();
}

class _ProcurementScreenState extends State<ProcurementScreen> {
  final _formKey = GlobalKey<FormState>();
  String _itemName = '';
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procurement Request'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Item Name'),
                onSaved: (value) => _itemName = value!,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter item name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _quantity = int.tryParse(value!) ?? 0,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter quantity'
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Logic to send the procurement request
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Request sent for $_quantity $_itemName(s).'),
                      ),
                    );
                    // Clear the form
                    _formKey.currentState!.reset();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Notify Purchase Department'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
