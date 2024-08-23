// Define the Song class
class Song {
  String title;
  String artist;
  int duration; // Duration in seconds

  // Constructor for Song class
  Song(this.title, this.artist, this.duration);

  // Method to display song details
  void display() {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    print('$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})');
  }
}

// Define the Playlist class
class Playlist {
  String name;
  List<Song> songs;

  // Constructor for Playlist class
  Playlist(this.name) : songs = [];

  // Method to add a song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Method to display all songs in the playlist
  void displayPlaylist() {
    print('Playlist: $name');
    for (var song in songs) {
      song.display();
    }
  }

  // Method to sort songs by artist
  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }
}

// Define the MusicFestival class
class MusicFestival {
  String name;
  List<Playlist> stages;

  // Constructor for MusicFestival class
  MusicFestival(this.name) : stages = [];

  // Method to add a playlist to the festival
  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  // Method to calculate the total duration of the festival
  int totalFestivalDuration() {
    return stages.fold(0, (sum, playlist) => sum + playlist.songs.fold(0, (songSum, song) => songSum + song.duration));
  }

  // Method to display all playlists in the festival
  void displayFestival() {
    print('Music Festival: $name');
    for (var stage in stages) {
      stage.displayPlaylist();
    }
  }
}

// Main function
void main() {
  // Create LANY songs
  Song song1 = Song('Birds Of a Feather', 'Billie Eilish', 240);
  Song song2 = Song('Saan', 'Saan', 234);
  Song song3 = Song('Sandali', 'MRLD', 221);
  Song song4 = Song('One Spark', 'Twice', 237);
  Song song5 = Song('Karera', 'BINI', 194);
  Song song6 = Song('Tahanan', 'Adie', 223);
  Song song7 = Song('Set me Free', 'Twice', 196);

  // Create playlists (stages)
  Playlist mainStage = Playlist('Main Stage');
  Playlist indieStage = Playlist('Indie Stage');
  Playlist electronicStage = Playlist('Electronic Stage');

  // Add songs to playlists
  mainStage.addSong(song1);
  mainStage.addSong(song4);
  mainStage.addSong(song5);
  mainStage.addSong(song6);
  mainStage.addSong(song7);

  indieStage.addSong(song2);

  electronicStage.addSong(song3);

  // Create a music festival and add the stages
  MusicFestival festival = MusicFestival('Twice Music Festival');
  festival.addStage(mainStage);
  festival.addStage(indieStage);
  festival.addStage(electronicStage);

  // Display the total festival duration
  print('Total Festival Duration: ${festival.totalFestivalDuration()} seconds');


  // Display random songs
  print('Random Songs:');
  indieStage.songs[0].display();
  electronicStage.songs[0].display();
  mainStage.songs[0].display(); // Randomly selected song


  // Sort and display Main Stage playlist by artist
  mainStage.sortByArtist();
  print('Main Stage playlist sorted by artist:');
  mainStage.displayPlaylist();
}