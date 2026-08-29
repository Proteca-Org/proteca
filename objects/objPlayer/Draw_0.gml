draw_sprite_ext(sprite_index, image_index, round(x), round(y), facing, yScale, image_angle, c_white, image_alpha);

if (showClothes) {
    draw_sprite_ext(sprHair, hair, x, y + bobOffset, facing, yScale, 1, hairColor, 1);
    draw_sprite_ext(sprBlouses, blouse, x, y + bobOffset, facing, yScale, 1, -1, 1);
    draw_sprite_ext(sprPants, pants, x, y + bobOffset, facing, yScale, 1, -1, 1);
    draw_sprite_ext(sprShoes, shoes, x, y + bobOffset, facing, yScale, 1, -1, 1);
    draw_sprite_ext(sprAccessories, accessory, x, y + bobOffset, facing, yScale, 1, -1, 1);
}

draw_sprite_ext(sprPlayerFaces, face, x, y + bobOffset, facing, yScale, 1, -1, 1);