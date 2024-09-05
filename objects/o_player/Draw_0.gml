// o_player Draw Event

// Draw the shadow for the player
draw_sprite_ext(spr_player_shadow, 0, x, y + 1, 1, -0.75, 0, c_white, 0.5);

// Draw the player sprite
draw_self();
