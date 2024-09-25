import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/design-system/atoms/logo.dart';
import 'package:ser_manos/src/design-system/cells/forms/form.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class SignInScreen extends HookConsumerWidget {
  static const String route = "/sign-in";
  static const String routeName = "Sign In";
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final authState = useState(const AuthState.initial());
    final authController = ref.read(authControllerProvider.notifier);

    ref.listen(authControllerProvider, ((previous, current) {
      authState.value = current;
    }));

    void onSignIn() async {
      if (_formKey.currentState?.validate() ?? false) {
        await authController.signIn(
          email: emailController.text,
          password: passwordController.text,
        );
        if (!context.mounted) return;
        if (!authState.value.isAuthenticated) return;
        Beamer.of(context).beamToNamed(WelcomeScreen.route);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SMHeader.modal(
        implyLeading: false,
      ),
      body: BaseScreen(
        content: [
          const Spacer(),
          const SquaredLogo(),
          const SMGap.vertical(
            height: 32,
          ),
          SMForm.signIn(
            emailController: emailController,
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
            unauthenticated: (message) => [
              const Spacer(),
              Center(
                child: SMTypography.body02(
                  message ?? "",
                  color: SMColors.error100,
                ),
              ),
            ],
            orElse: () => [],
          ),
          const Spacer(),
          const SMGap.vertical(
            height: 16,
          ),
          SMFill.horizontal(
            child: SMButton.filled(
              "Iniciar Sesión",
              onPressed: onSignIn,
            ),
          ),
          const SMGap.vertical(
            height: 16,
          ),
          SMFill.horizontal(
            child: SMButton.text(
              "No tengo cuenta",
              onPressed: () =>
                  Beamer.of(context).beamToNamed(SignUpScreen.route),
            ),
          ),
          const SMGap.vertical(
            height: 32,
          ),
        ],
      ),
    );
  }
}
