import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/design-system/atoms/logo.dart';
import 'package:ser_manos/src/design-system/cells/forms/form.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends HookConsumerWidget {
  static const String route = "/sign-in";
  static const String routeName = "Sign In";
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);

    final authState = useState(const AuthState.initial());
    final authController = ref.read(authControllerProvider.notifier);

    ref.listen(authControllerProvider, ((previous, current) {
      authState.value = current;
    }));

    void onSignIn() async {
      if (_formKey.currentState?.validate() ?? false) {
        isLoading.value = true;
        await authController.signIn(
          email: emailController.text,
          password: passwordController.text,
        );
        isLoading.value = false;
        if (!context.mounted) return;
        if (!authState.value.isAuthenticated) return;
        Beamer.of(context).beamToNamed(VolunteerScreen.route);
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
            context: context,
          ),
          ...authState.value.maybeWhen(
            loading: () => [
              const Spacer(),
              const SMGap.vertical(height: 16),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
            unauthenticated: (message) => [
              const Spacer(),
              const SMGap.vertical(height: 16),
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
              AppLocalizations.of(context)!.login,
              onPressed: onSignIn,
              disabled: isLoading.value,
            ),
          ),
          const SMGap.vertical(
            height: 16,
          ),
          SMFill.horizontal(
            child: SMButton.text(
              AppLocalizations.of(context)!.noAccount,
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
