// o_level Cleanup Event

// Cleanup ds_grid
if (ds_exists(grid_, ds_type_grid)) {
    ds_grid_destroy(grid_);
    grid_ = noone; // Mark as invalid
}

// Cleanup shadow surface
if (surface_exists(shadow_surface_)) {
    surface_free(shadow_surface_);
    shadow_surface_ = noone; // Mark as invalid
}