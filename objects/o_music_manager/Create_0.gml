if (audio_is_playing(time_for_adventure)) {
    audio_stop_sound(time_for_adventure);
}
audio_play_sound(time_for_adventure, 1, true); // Play the sound in a loop

var music_track = time_for_adventure; // Ensure 'time_for_adventure' is correctly referenced
if (audio_is_playing(music_track)) {
    audio_stop_sound(music_track);
}
audio_play_sound(music_track, 1, true); // Play the sound in a loop