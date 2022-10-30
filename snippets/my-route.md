
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MusicAppDemo());
}

class MusicAppDemo extends StatelessWidget {
  MusicAppDemo({Key? key}) : super(key: key);

  final MusicDatabase database = MusicDatabase.mock();

  final GoRouter _router = GoRouter(
    initialLocation: '/library',
    routes: <RouteBase>[
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MusicAppShell(
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/library',
            pageBuilder: (context, state) {
              return FadeTransitionPage(
                child: const LibraryScreen(),
                key: state.pageKey,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'album/:albumId',
                builder: (BuildContext context, GoRouterState state) {
                  return AlbumScreen(
                    albumId: state.params['albumId'],
                  );
                },
                routes: [
                  GoRoute(
                    path: 'song/:songId',
                    // Display on the root Navigator
                    builder: (BuildContext context, GoRouterState state) {
                      return SongScreen(
                        songId: state.params['songId']!,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/recents',
            pageBuilder: (context, state) {
              return FadeTransitionPage(
                child: const RecentlyPlayedScreen(),
                key: state.pageKey,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'song/:songId',
                // Display on the root Navigator
                builder: (BuildContext context, GoRouterState state) {
                  return SongScreen(
                    songId: state.params['songId']!,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) {
              final query = state.queryParams['q'] ?? '';
              return FadeTransitionPage(
                child: SearchScreen(
                  query: query,
                ),
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Music app',
      theme: ThemeData(primarySwatch: Colors.pink),
      routerConfig: _router,
      builder: (context, child) {
        return MusicDatabaseScope(
          state: database,
          child: child!,
        );
      },
    );
  }
}

class MusicAppShell extends StatelessWidget {
  final Widget child;

  const MusicAppShell({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_music_rounded),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Recently Played',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/recents')) {
      return 1;
    } else if (location.startsWith('/search')) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        GoRouter.of(context).go('/recents');
        break;
      case 2:
        GoRouter.of(context).go('/search');
        break;
      case 0:
      default:
        GoRouter.of(context).go('/library');
        break;
    }
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: ListView.builder(
        itemBuilder: (context, albumId) {
          final album = database.albums[albumId];
          return AlbumTile(
            album: album,
            onTap: () {
              GoRouter.of(context).go('/library/album/$albumId');
            },
          );
        },
        itemCount: database.albums.length,
      ),
    );
  }
}

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final songs = database.recentlyPlayed;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Played'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final song = songs[index];
          final albumIdInt = int.tryParse(song.albumId)!;
          final album = database.albums[albumIdInt];
          return SongTile(
            album: album,
            song: song,
            onTap: () {
              GoRouter.of(context).go('/recents/song/${song.fullId}');
            },
          );
        },
        itemCount: songs.length,
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  final String query;

  const SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _currentQuery;

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final songs = database.search(widget.query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newSearch) {
                _currentQuery = newSearch;
              },
              onEditingComplete: () {
                GoRouter.of(context).go(
                  '/search?q=$_currentQuery',
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final song = songs[index];
                return SongTile(
                  album: database.albums[int.tryParse(song.albumId)!],
                  song: song,
                  onTap: () {
                    GoRouter.of(context).go(
                        '/library/album/${song.albumId}/song/${song.fullId}');
                  },
                );
              },
              itemCount: songs.length,
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumScreen extends StatelessWidget {
  final String? albumId;

  const AlbumScreen({
    required this.albumId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final albumIdInt = int.tryParse(albumId ?? '');
    final album = database.albums[albumIdInt!];
    return Scaffold(
      appBar: AppBar(
        title: Text('Album - ${album.title}'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Container(
                    color: album.color,
                    margin: const EdgeInsets.all(8),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      album.artist,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final song = album.songs[index];
                  return ListTile(
                    title: Text(song.title),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        color: album.color,
                        margin: const EdgeInsets.all(8),
                      ),
                    ),
                    trailing: SongDuration(
                      duration: song.duration,
                    ),
                    onTap: () {
                      GoRouter.of(context)
                          .go('/library/album/$albumId/song/${song.fullId}');
                    },
                  );
                },
                itemCount: album.songs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongScreen extends StatelessWidget {
  final String songId;

  const SongScreen({
    Key? key,
    required this.songId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = MusicDatabase.of(context);
    final song = database.getSongById(songId);
    final albumIdInt = int.tryParse(song.albumId);
    final album = database.albums[albumIdInt!];

    return Scaffold(
      appBar: AppBar(
        title: Text('Song - ${song.title}'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Container(
                  color: album.color,
                  margin: const EdgeInsets.all(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      album.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MusicDatabase {
  final List<Album> albums;
  final List<Song> recentlyPlayed;
  final Map<String, Song> _allSongs = {};

  MusicDatabase(this.albums, this.recentlyPlayed) {
    _populateAllSongs();
  }

  factory MusicDatabase.mock() {
    final albums = _mockAlbums().toList();
    final recentlyPlayed = _mockRecentlyPlayed(albums).toList();
    return MusicDatabase(albums, recentlyPlayed);
  }

  Song getSongById(String songId) {
    if (_allSongs.containsKey(songId)) {
      return _allSongs[songId]!;
    }
    throw ('No song with ID $songId found.');
  }

  List<Song> search(String searchString) {
    final songs = <Song>[];
    for (var song in _allSongs.values) {
      final album = albums[int.tryParse(song.albumId)!];
      if (song.title.contains(searchString) ||
          album.title.contains(searchString)) {
        songs.add(song);
      }
    }
    return songs;
  }

  void _populateAllSongs() {
    for (var album in albums) {
      for (var song in album.songs) {
        _allSongs[song.fullId] = song;
      }
    }
  }

  static MusicDatabase of(BuildContext context) {
    final routeStateScope =
    context.dependOnInheritedWidgetOfExactType<MusicDatabaseScope>();
    if (routeStateScope == null) throw ('No RouteState in scope!');
    return routeStateScope.state;
  }

  static Iterable<Album> _mockAlbums() sync* {
    for (var i = 0; i < Colors.primaries.length; i++) {
      final color = Colors.primaries[i];
      final title = WordPair.random().toString();
      final artist = WordPair.random().toString();
      final songs = <Song>[];
      for (var j = 0; j < 12; j++) {
        final minutes = math.Random().nextInt(3) + 3;
        final seconds = math.Random().nextInt(60);
        final title = WordPair.random();
        final duration = Duration(minutes: minutes, seconds: seconds);
        final song = Song('$j', '$i', '$title', duration);

        songs.add(song);
      }
      yield Album('$i', title, artist, color, songs);
    }
  }

  static Iterable<Song> _mockRecentlyPlayed(List<Album> albums) sync* {
    for (var album in albums) {
      final songIndex = math.Random().nextInt(album.songs.length);
      yield album.songs[songIndex];
    }
  }
}

class MusicDatabaseScope extends InheritedWidget {
  final MusicDatabase state;

  const MusicDatabaseScope({
    required this.state,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is MusicDatabaseScope && state != oldWidget.state;
  }
}

class Album {
  final String id;
  final String title;
  final String artist;
  final Color color;
  final List<Song> songs;

  Album(this.id, this.title, this.artist, this.color, this.songs);
}

class Song {
  final String id;
  final String albumId;
  final String title;
  final Duration duration;

  Song(this.id, this.albumId, this.title, this.duration);

  String get fullId => '$albumId-$id';
}

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback? onTap;

  const AlbumTile({Key? key, required this.album, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          color: album.color,
        ),
      ),
      title: Text(album.title),
      subtitle: Text(album.artist),
      onTap: onTap,
    );
  }
}

class SongTile extends StatelessWidget {
  final Album album;
  final Song song;
  final VoidCallback? onTap;

  const SongTile({Key? key, required this.album, required this.song, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          color: album.color,
          margin: const EdgeInsets.all(8),
        ),
      ),
      title: Text(song.title),
      trailing: SongDuration(
        duration: song.duration,
      ),
      onTap: onTap,
    );
  }
}

class SongDuration extends StatelessWidget {
  final Duration duration;

  const SongDuration({
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}');
  }
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
      key: key,
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
          FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
      child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}


https://dartpad.dev/?id=2f8a1f806f2f67ce0426a4b0a00ce0d4