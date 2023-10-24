import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';
import '../../theme/text_theme.dart';

void showProfileupdateDialog(BuildContext context, TextEditingController nameController, TextEditingController emailController, TextEditingController passwordController) {
  final tt = CustomTextTheme();
  bool isUpdating = false;
  if (!context.mounted) {
    return; // Do nothing if the widget is not mounted.
  }
  showDialog(
    context: context,
    builder: (BuildContext bContext) {
      return StatefulBuilder(
        builder: (bContext,setState) {
          return AlertDialog(
            title: Text('Enter Details', style: tt.bold),
            content: Container(
              height: 200,
              width: MediaQuery
                  .of(context)
                  .size
                  .width >= 500 ? 500 : MediaQuery
                  .of(context)
                  .size
                  .width,
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: MediaQuery
                    .of(context)
                    .size
                    .width >= 500 ? 500 : MediaQuery
                    .of(context)
                    .size
                    .width,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(color: AppColorsDark.primaryBlack,
                      child: Text('Full Name', style: tt.bodyText1)),
                  const SizedBox(height: 6.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Kimi no nawa?',
                      hintStyle: tt.subtitle2,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Title(color: AppColorsDark.primaryBlack,
                      child: Text('Email Address', style: tt.bodyText1)),
                  const SizedBox(height: 6.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email address',
                      hintStyle: tt.subtitle2,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(bContext).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  // Close the dialog
                  Navigator.of(bContext).pop();
                },
                child:isUpdating? CircularProgressIndicator(): Text('Save'),
              ),
            ],
          );
        }
      );
    },
  );
}