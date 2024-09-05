// o_player Create Event

// Initialize player movement variables
x_speed_ = 0;
y_speed_ = 0;
max_speed_ = 2;
acceleration_ = 0.5;

// Initialize camera target variable
camera_initialized = false;

// Timer for checking camera initialization
camera_check_timer = 0;

// Set fullscreen mode if not already set
if (!window_get_fullscreen()) {
    window_set_fullscreen(true);
}

// Set initial position
x = room_width / 2;
y = room_height / 2;

// Ensure the sprite exists and is visible
if (sprite_exists(spr_soldier_idle)) {
    sprite_index = spr_soldier_idle;
} else {
    show_debug_message("Sprite 'spr_soldier_idle' does not exist.");
}

show_debug_message("Player position initialized");
