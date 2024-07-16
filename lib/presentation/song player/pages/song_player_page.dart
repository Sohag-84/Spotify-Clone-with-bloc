import 'package:flutter/material.dart';
import 'package:spotify_clone_using_bloc/common/widgets/appbar/appbar_button.dart';
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


}
