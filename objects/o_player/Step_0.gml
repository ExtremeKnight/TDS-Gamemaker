// o_player Step Event

// Increment the camera check timer
camera_check_timer += delta_time;

// Check if the camera is initialized
if (!camera_initialized && camera_check_timer >= 100) { // Check every 100 milliseconds
    camera_initialized = instance_exists(o_camera);
    if (camera_initialized) {
        o_camera.target_ = id;
        show_debug_message("Camera initialized and target set.");
    }
}

// Check for player input
var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Toggle fullscreen mode
if (keyboard_check_pressed(vk_f11)) {
    var current_fullscreen = window_get_fullscreen();
    window_set_fullscreen(!current_fullscreen);
}

// Update speed based on input
x_speed_ += _x_input * acceleration_;
y_speed_ += _y_input * acceleration_;

// Limit the speed to the maximum speed
var _speed = point_distance(0, 0, x_speed_, y_speed_);
var _direction = point_direction(0, 0, x_speed_, y_speed_);
if (_speed > max_speed_) {
    x_speed_ = lengthdir_x(max_speed_, _direction);
    y_speed_ = lengthdir_y(max_speed_, _direction);
}

// Smoothly decelerate to 0 when there's no input
if (_x_input == 0) {
    x_speed_ = lerp(x_speed_, 0, 0.3);
}
if (_y_input == 0) {
    y_speed_ = lerp(y_speed_, 0, 0.3);
}

// Determine new position
var _new_x = x + x_speed_;
var _new_y = y + y_speed_;

// Check for collisions and update position
var _collision_x = !place_meeting(_new_x, y, o_level); // Check collisions for horizontal movement
var _collision_y = !place_meeting(x, _new_y, o_level); // Check collisions for vertical movement

if (_collision_x) {
    x = _new_x; // Update horizontal position if no collision
} else {
    x_speed_ = 0; // Stop horizontal movement if collision detected
}

if (_collision_y) {
    y = _new_y; // Update vertical position if no collision
} else {
    y_speed_ = 0; // Stop vertical movement if collision detected
}

// Set the correct sprite and ensure proper animation speed
if (_x_input == 0 && _y_input == 0) {
    sprite_index = spr_soldier_idle;
    image_speed = 0.5; // Adjust the speed as needed for idle animation
} else {
    sprite_index = spr_soldier_walk;
    image_speed = 0.7; // Adjust the speed as needed for walking animation
}

// Set the direction the sprite should face
if (x_speed_ > 0) {
    image_xscale = 1; // Facing right
} else if (x_speed_ < 0) {
    image_xscale = -1; // Facing left
}
