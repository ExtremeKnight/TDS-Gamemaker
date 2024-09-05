// o_camera Create Event

// Initialize camera target and dimensions
target_ = o_player; // Set the target to the player
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);
scale_ = width_ / view_get_wport(0);

// Ensure the target is valid and initialize camera position
if (instance_exists(target_)) {
    x = target_.x;
    y = target_.y;
    camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);
} else {
    show_debug_message("Target not set or does not exist.");
}
