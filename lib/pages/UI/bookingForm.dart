import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/pages/UI/confirmationPage.dart';

class BookingFormPage extends StatefulWidget {
  final String productTitle;

  BookingFormPage({required this.productTitle});

  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryMonthController = TextEditingController();
  final _expiryYearController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form - ${widget.productTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter your details to book ${widget.productTitle}',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Card Number'),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only allow digits
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your card number';
                    } else if (value.length < 16) {
                      return 'Card number must be 16 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryMonthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Expiry Month'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only allow digits
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiry month';
                          } else if (int.tryParse(value) == null ||
                              int.parse(value) < 1 ||
                              int.parse(value) > 12) {
                            return 'Invalid expiry month';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _expiryYearController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Expiry Year'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only allow digits
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiry year';
                          } else if (int.tryParse(value) == null ||
                              int.parse(value) < DateTime.now().year) {
                            return 'Invalid expiry year';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'CVV'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only allow digits
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter CVV';
                          } else if (value.length < 3) {
                            return 'CVV must be 3 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with booking logic
                      // Access entered data using controllers
                      final name = _nameController.text;
                      final email = _emailController.text;
                      final phone = _phoneController.text;
                      final cardNumber = _cardNumberController.text;
                      final expiryMonth = _expiryMonthController.text;
                      final expiryYear = _expiryYearController.text;
                      final cvv = _cvvController.text;

                      // Navigate to ConfirmationPage with the form validation result
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmationPage(
                            isFormValid: true, // Pass true for success
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
