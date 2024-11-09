import 'dart:io';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/auth/providers/user_provider.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/validators/validator.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class EditProfileScreen extends HookConsumerWidget {
  static const String route = '/home/profile/edit';
  static const String routeName = 'profile_edit';
  EditProfileScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFormValid = useState(false);
    final currentGender = useState(Gender.male);
    final dateController = useTextEditingController();
    final phoneController = useTextEditingController();
    final emailController = useTextEditingController();
    final imageProvider = useState(null as ImageProvider?);
    final image = useState(null as XFile?);
    final userService = ref.watch(userServiceProvider);
    final currentUser = ref.watch(currentUserProvider);
    final isLoading = useState(false);

    void onImagePicked(XFile? file) {
      if (file != null) {
        imageProvider.value = Image.file(File(file.path)).image;
        image.value = file;
      }
    }

    currentUser.whenData((user) {
      if (dateController.text.isEmpty) {
        dateController.text = user.birthdate!;
      }
      if (phoneController.text.isEmpty) {
        phoneController.text = user.phone!;
      }
      if (emailController.text.isEmpty) {
        emailController.text = user.email!;
      }
      imageProvider.value ??= NetworkImage(user.image!);
    });

    return Scaffold(
      appBar: SMHeader.modal(),
      backgroundColor: SMColors.neutral0,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: SMGrid(
          child: SingleChildScrollView(
            child: Form(
              onChanged: () => isFormValid.value =
                  _formKey.currentState?.validate() ?? false,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SMTypography.headline01("Datos de perfil"),
                  const SMGap.vertical(height: 24),
                  SMCalendarInput(
                    controller: dateController,
                    hintText: "DD/MM/YYYY",
                    labelText: "Fecha de nacimiento",
                  ),
                  const SMGap.vertical(height: 24),
                  SMCard.input(
                    title: "Información de perfil",
                    groupValue: currentGender.value,
                    onChanged: (Gender? value) =>
                        currentGender.value = value ?? Gender.male,
                  ),
                  const SMGap.vertical(height: 24),
                  SMCard.profile(
                    onImagePicked: onImagePicked,
                    image: imageProvider.value,
                  ),
                  const SMGap.vertical(height: 32),
                  SMTypography.headline01("Datos de contacto"),
                  const SMGap.vertical(height: 24),
                  SMTypography.subtitle01(
                    "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
                  ),
                  const SMGap.vertical(height: 24),
                  SMTextInput(
                    controller: phoneController,
                    labelText: "Teléfono",
                    hintText: "+5491141625944",
                    validator: SMValidator.required,
                  ),
                  const SMGap.vertical(height: 24),
                  SMTextInput(
                    controller: emailController,
                    labelText: "Mail",
                    hintText: "mimail@mail.com",
                    validator: SMValidator.email,
                  ),
                  const SMGap.vertical(height: 32),
                  SMFill.horizontal(
                    child: SMButton.filled(
                      "Guardar datos",
                      onPressed: () async {
                        currentUser.whenData((user) async {
                          isLoading.value = true;
                          await userService.updateUser(
                              user.uuid,
                              image.value,
                              dateController.text,
                              currentGender.value,
                              phoneController.text,
                              emailController.text);
                        });
                        isLoading.value = false;
                        Beamer.of(context).beamBack();
                      },
                      disabled: !isFormValid.value || isLoading.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
