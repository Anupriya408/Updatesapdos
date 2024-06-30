import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_project/repositories/auth_repository.dart' as authRepo;
import 'package:first_project/repositories/doctor/doctor2_repository.dart';
import 'package:first_project/providers/authprovider.dart';
import 'package:first_project/bloc/REGISTER/register_bloc.dart';
import 'package:first_project/bloc/LOGIN/login_bloc.dart';
import 'package:first_project/screens/login/login_screen_01.dart';
import 'package:first_project/screens/login/login_screen_02.dart';
import 'package:first_project/screens/login/login_screen_03.dart';
import 'package:first_project/screens/doctors/doctor_screen_01.dart';
import 'package:first_project/screens/patients/patient_screen_01.dart';
import 'package:first_project/screens/patients/patient_screen_02.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepository = authRepo.AuthenticationRepository();
    final doctor2Repository = Doctor2Repository();
    final loginBloc = LoginBloc(authenticationRepository: authRepository);
    final registerBloc = RegisterBloc(authenticationRepository: authRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<authRepo.AuthenticationRepository>(
          create: (_) => authRepository,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            doctor2Repository: doctor2Repository,
          ),
        ),
        Provider<Doctor2Repository>(
          create: (context) => doctor2Repository,
        ),
        Provider<LoginBloc>(
          create: (_) => loginBloc,
        ),
        Provider<RegisterBloc>(
          create: (_) => registerBloc,
        ),
      ],
      child: MaterialApp(
        title: 'SAPDOS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen01(),
          '/login': (context) => LoginScreen02(),
          '/register': (context) => LoginScreen03(),
          '/doctor': (context) => DoctorScreen(),
          '/patient': (context) => PatientScreen(),
          '/patient/detail': (context) => PatientScreen2(doctorId: ''),
        },
      ),
    );
  }
}
