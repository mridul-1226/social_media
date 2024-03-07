import 'package:flutter/material.dart';
import 'package:social_media/firebase.dart';
import 'package:social_media/widgets/text_form_fields.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  late String _selectedBatch;

  @override
  void initState() {
    super.initState();
    _selectedBatch = _getCurrentYear().toString();
  }

  int _getCurrentYear() {
    return DateTime.now().year;
  }

  List<String> _generateBatchYears() {
    int currentYear = _getCurrentYear();
    List<String> years = [];
    for (int i = 0; i < 5; i++) {
      years.add((currentYear + i).toString());
    }
    return years;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomTextFormFields(
                label: 'Name',
                controller: nameController,
                obscureText: false,
                type: TextInputType.text,
              ),
              CustomTextFormFields(
                  label: 'Email',
                  controller: emailController,
                  obscureText: false,
                  type: TextInputType.emailAddress),
              CustomTextFormFields(
                  label: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  type: TextInputType.text),
              CustomTextFormFields(
                  label: 'Mobile Number',
                  controller: contactController,
                  obscureText: false,
                  type: TextInputType.number),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    value: _selectedBatch,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedBatch = newValue!;
                      });
                    },
                    items: _generateBatchYears()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Batch',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your batch';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  FirebaseFunctions.signUp(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      contactController.text,
                      _selectedBatch.toString(),
                      context);
                },
                icon: const Icon(Icons.login_rounded),
                style: ElevatedButton.styleFrom(
                  elevation: 15,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
                ),
                label: const Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, letterSpacing: 1.4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
