// o_camera Step Event

// Ensure the target exists
if (!instance_exists(target_)) {
    return; // Exit if the target doesn't exist
}

// Smoothly interpolate the camera position towards the target
x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y, 0.1); // Adjusted to follow target

// Clamp the camera position within the room boundaries
x = clamp(x, width_ / 2, room_width - width_ / 2);
y = clamp(y, height_ / 2, room_height - height_ / 2);

// Update the camera's view position
camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);