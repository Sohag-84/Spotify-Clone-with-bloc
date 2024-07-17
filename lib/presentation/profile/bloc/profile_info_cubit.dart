import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/auth/user.dart';
import 'package:spotify_clone_using_bloc/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  void getUser() async {
    var user = await sl<GetUserUseCase>().call();

    user.fold((l) => emit(ProfileInfoFailure()), (userEntity) {
      emit(ProfileInfoLoaded(userEntity: userEntity));
    });
  }
}
