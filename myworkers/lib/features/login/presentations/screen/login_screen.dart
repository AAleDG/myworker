import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/core/common_widgets/app_scaffold.dart';
import 'package:myworkers/core/l10n/l10n_ext.dart';
import 'package:myworkers/core/router/router.dart';
import 'package:myworkers/features/login/cubit/login_cubit.dart';
import 'package:myworkers/features/supabase/supabase_utilies.dart';

import '../../../../core/common_widgets/export_widgets.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> keys;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    keys = GlobalKey<FormState>();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: keys,
      child: AppScaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                AppText(
                  context.l10nCore.loginPageTitle,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextField(
                  onChange: cubit.updateEmail,
                  controller: cubit.emailController,
                  focusNode: _emailFocusNode,
                  hintText: context.l10nCore.loginPageEmailHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10nCore.loginPageHintTextErrorEmptyEmail;
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return context.l10nCore.loginPageHintTextValidEmail;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return AppTextField(
                      onChange: cubit.updatePassword,
                      controller: cubit.passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: context.l10nCore.loginPagePasswordHint,
                      obscureText: state.showPassword,
                      onPressed: () {
                        cubit.toggleShowPassword();
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context
                              .l10nCore.loginPageHintTextErrorEmptyPassword;
                        } else if (value.length > 12) {
                          return context
                              .l10nCore.loginPageHintTextValidPassword;
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Checkbox(
                          value: state.rememberAccessData,
                          activeColor: Colors.blue,
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          onChanged: (_) => cubit.updateDataaccess(),
                        ),
                        AppText(
                          context.l10nCore.loginPageRememberMe,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  onPressed: () async {
                    if (keys.currentState!.validate()) {
                      SupabaseUtilies()
                          .signIn(
                        cubit.emailController.text,
                        cubit.passwordController.text,
                      )
                          .then((value) {
                        if (value.session != null) {
                          AutoRouter.of(context).replace( HomeRoute());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: AppText('Error during login process'),
                            ),
                          );
                        }
                      });
                    }
                  },
                  textButton: context.l10nCore.loginPageAccessButtonText,
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () => AutoRouter.of(context).popForced(),
                  textButton: context.l10nCore.loginBackButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
