import 'package:e_commerce_app/business_logic/repository/user_repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/constants/color_constant.dart';
import 'package:e_commerce_app/views/screens/login/bloc/login_bloc.dart';
import 'package:e_commerce_app/views/screens/login/widgets/login_form.dart';
import 'package:e_commerce_app/views/screens/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: Scaffold(
        backgroundColor: mAccentShadeColor,
        body: SafeArea(
          child: ListView(
            children: [
              LoginHeader(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
