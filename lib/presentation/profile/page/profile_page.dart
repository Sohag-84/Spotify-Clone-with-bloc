import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone_using_bloc/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_using_bloc/common/widgets/appbar/appbar_button.dart';
import 'package:spotify_clone_using_bloc/core/config/constants/app_urls.dart';
import 'package:spotify_clone_using_bloc/presentation/profile/bloc/favorite_song_cubit.dart';
import 'package:spotify_clone_using_bloc/presentation/profile/bloc/favorite_song_state.dart';
import 'package:spotify_clone_using_bloc/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_clone_using_bloc/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_clone_using_bloc/presentation/song%20player/pages/song_player_page.dart';

import '../../../common/widgets/favorite button/favorite_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BassicAppBar(
        backgroundColor: Color(0xFF2C2B2B),
        title: Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          const Gap(20),
          _favoriteSongs(),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit(),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode ? const Color(0xFF2C2B2B) : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileInfoLoaded) {
            return Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.userEntity.imageUrl.toString(),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Text(state.userEntity.email.toString()),
                Text(
                  state.userEntity.fullName.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
          if (state is ProfileInfoFailure) {
            return const Center(
              child: Text("Something is wrong. Plz try again"),
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget _favoriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("FAVORITE SONGS"),
            const Gap(10),
            BlocBuilder<FavoriteSongCubit, FavoriteSongState>(
              builder: (context, state) {
                if (state is FavoriteSongLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FavoriteSongLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongPlayerPage(
                                songEntity: state.favoriteSongs[index],
                                coverPhoto: coverPhotoList[index],
                                songUrl: songUrlList[index],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///song cover photo, title and artists name
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        coverPhotoList[index],
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.favoriteSongs[index].title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      state.favoriteSongs[index].artist,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            ///song duration
                            Row(
                              children: [
                                Text(
                                  state.favoriteSongs[index].duration
                                      .toString()
                                      .replaceAll(".", ":"),
                                ),
                                const Gap(15),
                                FavoriteButton(
                                  key: UniqueKey(),
                                  songEntity: state.favoriteSongs[index],
                                  function: () {
                                    context
                                        .read<FavoriteSongCubit>()
                                        .removeSong(index: index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: state.favoriteSongs.length,
                  );
                }
                if (state is FavoriteSongFailure) {
                  return const Center(
                    child: Text("Something is wrong. Plz try again."),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
