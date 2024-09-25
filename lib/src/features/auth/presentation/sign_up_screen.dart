import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/design-system/atoms/logo.dart';
import 'package:ser_manos/src/design-system/cells/forms/form.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class SignUpScreen extends HookConsumerWidget {
  static const String route = "/sign-up";
  static const String routeName = "Sign Up";
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final authState = useState(const AuthState.initial());

    ref.listen(authControllerProvider, ((previous, current) {
      authState.value = current;
    }));

    void onSignUp() async {
      if (_formKey.currentState?.validate() ?? false) {
        await ref.read(authControllerProvider.notifier).signUp(
              email: emailController.text,
              password: passwordController.text,
              name: nameController.text,
              surname: lastNameController.text,
            );
        if (!context.mounted) return;
        if (!authState.value.isAuthenticated) return;
        Beamer.of(context).beamToNamed(WelcomeScreen.route);
      }
    }

    return BaseScreen(
      content: [
        const SquaredLogo(),
        const SMGap.vertical(
          height: 32,
        ),
        SMForm.signUp(
          emailController: emailController,
          lastNameController: lastNameController,
          nameController: nameController,
          passwordController: passwordController,
          formKey: _formKey,
        ),
        ...authState.value.maybeWhen(
          loading: () => [
            const Spacer(),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
          unauthenticated: (error) => [
            const Spacer(),
            SMTypography.body01(
              error ?? "",
              color: SMColors.error100,
            ),
          ],
          orElse: () => [],
        ),
        const Spacer(),
        SMFill.horizontal(
          child: SMButton.filled(
            "Registrarse",
            onPressed: onSignUp,
          ),
        ),
        const SMGap.vertical(
          height: 16,
        ),
        SMFill.horizontal(
          child: SMButton.text(
            "Ya tengo cuenta",
            onPressed: () => Beamer.of(context).beamToNamed(SignInScreen.route),
          ),
        ),
        const SMGap.vertical(
          height: 32,
        ),
      ],
    );
  }
}
