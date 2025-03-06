import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_events.dart';
import 'package:task_turn_digital/features/auth/presentation/bloc/auth_states.dart';

import '../../data/models/user_model.dart';
import '../../data/repo/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc() : super(AuthInitialState()){
    on<RegisterEvent>(register);
  }
  UserModel? userModel;
  Future<void>register(RegisterEvent event, Emitter<AuthState> emit)async{
    emit(RegisterLoadingState());
    await AuthRepo.register(
        name:event.name ,
        email: event.email,
        password: event.password).then((value){
          if(value!=null){
            userModel= value;
            emit(RegisterSuccessState());
          }else{
            emit(RegisterErrorState('SomeThing went wrong'));
          }
    });
  }
}