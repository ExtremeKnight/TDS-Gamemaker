// Define the top-left corner of the viewport or screen where the display should be
var draw_x = view_xview[0];
var draw_y = view_yview[0];

// Draw the background sprite for the player
draw_sprite(spr_player_bg, 0, draw_x, draw_y);

// Check if the player instance exists
if (instance_exists(o_player)) {
    var bg_width = sprite_get_width(spr_player_bg);
    var bg_height = sprite_get_height(spr_player_bg);
    
    var portrait_width = sprite_get_width(spr_player_portrait);
    var portrait_height = sprite_get_height(spr_player_portrait);
    
    // Calculate the portrait position to center it within the background
    var portrait_x = draw_x + (bg_width - portrait_width) / 2; // Centered horizontally
    var portrait_y = draw_y + (bg_height - portrait_height) / 2; // Centered vertically

    // Draw the portrait sprite on top of the background
    draw_sprite(spr_player_portrait, 0, portrait_x, portrait_y);
} else {
    // Optionally, you can uncomment this line to display a message if o_player does not exist
    // draw_text(draw_x, draw_y - 20, "Player not found!");
}
