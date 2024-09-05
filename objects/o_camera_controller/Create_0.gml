// o_camera_controller Create Event

// Ensure the camera is created first
if (instance_exists(o_camera)) {
    // Initialize view dimensions
    var view_width = 320;
    var view_height = 180;

    // Get screen resolution
    var screen_width = display_get_width();
    var screen_height = display_get_height();

    // Calculate scale factor to fit the smallest dimension
    var scale_x = screen_width / view_width;
    var scale_y = screen_height / view_height;
    var scale = min(scale_x, scale_y);

    // Set viewport properties for the camera
    view_set_wview(0, view_width * scale);
    view_set_hview(0, view_height * scale);
    view_set_xview(0, 0);
    view_set_yview(0, 0);

    // Ensure the view is visible
    view_set_visible(0, true);
} else {
    show_debug_message("Camera instance not found. Please ensure o_camera exists.");
}
