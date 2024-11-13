import 'package:flutter/material.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/password_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/validators/validator.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class SMForm extends StatelessWidget {
  const SMForm({super.key, required this.formKey, required this.children});

  factory SMForm.contactDetails({
    required GlobalKey<FormState> formKey,
    required TextEditingController phoneController,
    required TextEditingController emailController,
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTypography.headline01("Datos de contacto"),
        const SMGap.vertical(height: 24.0),
        SMTypography.subtitle01(
            "Estos datos serán compartidos con la organización para ponerse en contacto contigo"),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: phoneController,
          labelText: "Teléfono",
          hintText: "Ej: +541178445459",
          validator: SMValidator.required,
        ),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: emailController,
          validator: SMValidator.email,
          labelText: "Mail",
          hintText: "Ej: mimail@mail.com",
        )
      ],
    );
  }

  factory SMForm.signIn({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTextInput(
          key: const Key('email_field'),
          controller: emailController,
          labelText: "Email",
          validator: SMValidator.email,
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          key: const Key('password_field'),
          controller: passwordController,
          labelText: "Contraseña",
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
  }) {
    return SMForm(
      formKey: formKey,
      children: [
        SMTextInput(
          controller: nameController,
          labelText: "Nombre",
          validator: SMValidator.required,
          hintText: "Ej: Juan",
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: lastNameController,
          labelText: "Apellido",
          hintText: "Ej: Barcena",
          validator: SMValidator.required,
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: emailController,
          labelText: "Email",
          validator: SMValidator.email,
          hintText: "Ej: juanbarcena@mail.com",
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          controller: passwordController,
          labelText: "Contraseña",
          hintText: "Ej: ABCD1234",
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
