import 'package:flutter/material.dart';
import 'package:task_shared_pref/app_colors.dart';
import 'package:task_shared_pref/core/utils/app_strings.dart';
import 'package:task_shared_pref/core/utils/shared_pre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? name;
  int? age;
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                controller: nameController,
                decoration: InputDecoration(
                  label: Text(AppStrings.nameLabel),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age is required';
                  }
                  return null;
                },
                controller: ageController,
                decoration: InputDecoration(
                  label: Text(AppStrings.ageLabel),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  foregroundColor: AppColors.buttonText,
                  fixedSize: Size(double.maxFinite, 50),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {}
                  await SharedPre.saveStringData('name', nameController.text);
                  await SharedPre.saveIntData(
                    'age',
                    int.parse(ageController.text),
                  );
                  setState(() {});
                },
                child: Text(AppStrings.saveButton),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  foregroundColor: AppColors.buttonText,
                  fixedSize: Size(double.maxFinite, 50),
                ),
                onPressed: () async {
                  name = await SharedPre.getString('name');
                  age = await SharedPre.getInt('age');
                  setState(() {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          color: Colors.white,
                        );
                      },
                    );
                  });
                },
                child: Text(AppStrings.getButton),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  foregroundColor: AppColors.buttonText,
                  fixedSize: Size(double.maxFinite, 50),
                ),
                onPressed: () async {
                  await SharedPre.removeData('name');
                  await SharedPre.removeData('age');
                  setState(() {});
                },
                child: Text(AppStrings.deleteButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
