import 'package:flutter/material.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/password_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/validators/validator.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMForm extends StatelessWidget {
  const SMForm({super.key, required this.formKey, required this.children});

  factory SMForm.contactDetails({
    required GlobalKey<FormState> formKey,
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required BuildContext context,
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTypography.headline01(AppLocalizations.of(context)!.contactDetails),
        const SMGap.vertical(height: 24.0),
        SMTypography.subtitle01(AppLocalizations.of(context)!.contactRemark),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: phoneController,
          labelText: AppLocalizations.of(context)!.phone,
          hintText: AppLocalizations.of(context)!.phoneExample,
          validator: (value) => SMValidator.required(value, context),
        ),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: emailController,
          validator: (value) => SMValidator.email(value, context),
          labelText: AppLocalizations.of(context)!.email,
          hintText: AppLocalizations.of(context)!.emailExample,
        )
      ],
    );
  }

  factory SMForm.signIn({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTextInput(
          key: const Key('email_field'),
          controller: emailController,
          labelText: AppLocalizations.of(context)!.email,
          validator: (value) => SMValidator.email(value, context),
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          key: const Key('password_field'),
          controller: passwordController,
          labelText: AppLocalizations.of(context)!.password,
        ),
      ],
    );
  }

  factory SMForm.signUp({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
    required TextEditingController lastNameController,
    required BuildContext context,
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTextInput(
          controller: nameController,
          labelText: AppLocalizations.of(context)!.name,
          validator: (value) => SMValidator.required(value, context),
          hintText: AppLocalizations.of(context)!.nameExample,
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: lastNameController,
          labelText: AppLocalizations.of(context)!.surname,
          hintText: AppLocalizations.of(context)!.surnameExample,
          validator: (value) => SMValidator.required(value, context),
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: emailController,
          labelText: AppLocalizations.of(context)!.email,
          validator: (value) => SMValidator.email(value, context),
          hintText: AppLocalizations.of(context)!.emailExample,
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          controller: passwordController,
          labelText: AppLocalizations.of(context)!.password,
          hintText: AppLocalizations.of(context)!.passwordExample,
        ),
      ],
    );
  }

  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: children,
      ),
    );
  }
}
