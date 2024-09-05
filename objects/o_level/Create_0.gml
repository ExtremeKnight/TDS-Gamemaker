// o_level Create Event

// Initialize variables
randomize();

// Initialize grid dimensions and create grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_ - 1, height_ - 1, VOID);

// Initialize other variables
_steps = 400; // Make sure this is properly initialized
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _direction_change_odds = 1; // Set direction change odds if needed

// Set the initial player position
var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH / 2;
var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT / 2;
instance_create_layer(_player_start_x, _player_start_y, "Instances", o_player);

// Debug message to confirm player creation
show_debug_message("Creating player at (" + string(_player_start_x) + ", " + string(_player_start_y) + ")");

// Generate the level
repeat (_steps) {
    grid_[# _controller_x, _controller_y] = FLOOR;
    
    // Randomize the direction
    if (irandom(_direction_change_odds) == _direction_change_odds) {
        _controller_direction = irandom(3);    
    }
    
    // Move the controller
    var _x_direction = lengthdir_x(1, _controller_direction * 90);
    var _y_direction = lengthdir_y(1, _controller_direction * 90);
    _controller_x += _x_direction;
    _controller_y += _y_direction;
    
    // Ensure the controller stays within the grid bounds
    if (_controller_x < 2 || _controller_x >= width_ - 2) {
        _controller_x -= _x_direction * 2;
    }
    if (_controller_y < 2 || _controller_y >= height_ - 2) {
        _controller_y -= _y_direction * 2;
    }
}

// Create the floor tiles by removing isolated void spaces
for (var _y = 1; _y < height_ - 1; _y++) {
    for (var _x = 1; _x < width_ - 1; _x++) {
        if (grid_[# _x, _y] != FLOOR) {
            var _north_tile = grid_[# _x, _y - 1] == VOID;
            var _west_tile = grid_[# _x - 1, _y] == VOID;
            var _east_tile = grid_[# _x + 1, _y] == VOID;
            var _south_tile = grid_[# _x, _y + 1] == VOID;
        
            var _tile_index = NORTH * _north_tile + WEST * _west_tile + EAST * _east_tile + SOUTH * _south_tile + 1;
            if (_tile_index == 1) {
                grid_[# _x, _y] = FLOOR; // Change isolated voids to floor
            }
        }
    }
}

// Place the wall tiles based on the grid
for (var _y = 1; _y < height_ - 1; _y++) {
    for (var _x = 1; _x < width_ - 1; _x++) {
        if (grid_[# _x, _y] != FLOOR) {
            var _north_tile = grid_[# _x, _y - 1] == VOID;
            var _west_tile = grid_[# _x - 1, _y] == VOID;
            var _east_tile = grid_[# _x + 1, _y] == VOID;
            var _south_tile = grid_[# _x, _y + 1] == VOID;
        
            var _tile_index = NORTH * _north_tile + WEST * _west_tile + EAST * _east_tile + SOUTH * _south_tile + 1;
            tilemap_set(_wall_map_id, _tile_index, _x, _y);
        }
    }
}

// Create the shadow surface
if (shadow_surface_ == noone || !surface_exists(shadow_surface_)) {
    shadow_surface_ = surface_create(room_width, room_height); // Create a new surface
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
        show_error("Failed to create shadow surface.", true);
    }
}

// Debug messages to confirm proper initialization
show_debug_message("Grid dimensions: " + string(width_) + "x" + string(height_));
show_debug_message("Steps: " + string(_steps));
