import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone_using_bloc/common/widgets/appbar/appbar_button.dart';
import 'package:spotify_clone_using_bloc/core/config/theme/app_colors.dart';
import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  final String coverPhoto;
  const SongPlayerPage({
    super.key,
    required this.songEntity,
    required this.coverPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BassicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(fontSize: 18),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _songCover(context),
              const Gap(15),
              _songDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(coverPhoto),
        ),
      ),
    );
  }

  Widget _songDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_outlined,
            color: AppColors.darkGrey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
