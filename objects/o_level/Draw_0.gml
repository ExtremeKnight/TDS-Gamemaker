// o_level Draw Event

// Check if the shadow surface exists and create it if not
if (shadow_surface_ == noone || !surface_exists(shadow_surface_)) {
    shadow_surface_ = surface_create(room_width, room_height);
    if (surface_exists(shadow_surface_)) {
        surface_set_target(shadow_surface_);
        draw_clear_alpha(c_black, 0);

        if (grid_ != undefined) {
            for (var _y = 1; _y < height_ - 1; _y++) {
                for (var _x = 1; _x < width_ - 1; _x++) {
                    if (grid_[# _x, _y] == FLOOR && grid_[# _x, _y - 1] == VOID) {
                        draw_sprite_ext(spr_shadow, 0, _x * CELL_WIDTH, _y * CELL_HEIGHT, 1, 1, 0, c_white, 0.5);
                    }
                }
            }
        }
        surface_reset_target();
        show_debug_message("Shadow surface created.");
    } else {
        show_debug_message("Failed to create shadow surface.");
    }
}

// Draw the shadow surface if it exists
if (surface_exists(shadow_surface_)) {
    draw_surface(shadow_surface_, 0, 0);
} else {
    show_debug_message("Shadow surface does not exist.");
}
