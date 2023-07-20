image_speed = 0;

spr = sprite_index;
sprHit = asset_get_index(sprite_get_name(spr) + "Hit");
key = vk_down;
altKey = global.downKeybind;
dir = Notes.down;

xOffsetTap = 0;
yOffsetTap = 0;
offset_tap_mult = 1;

botTimer = 0;

afterCreate = false;

if (global.downScroll) image_yscale = -image_yscale;

notesHitList = ds_list_create();

alarm[0] = 1;


