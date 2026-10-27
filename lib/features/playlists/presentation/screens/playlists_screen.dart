import 'package:flutter/material.dart';

import '../../data/playlists_data.dart';
import '../widgets/create_playlist_card.dart';
import '../widgets/playlist_card.dart';
import '../widgets/playlist_filter_chips.dart';
import '../widgets/playlists_header.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 140),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PlaylistsHeader(),
          ),
          const SizedBox(height: 8),
          const PlaylistFilterChips(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CreatePlaylistCard(),
                for (final item in playlists) ...[
                  const SizedBox(height: 16),
                  PlaylistCard(item: item),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
