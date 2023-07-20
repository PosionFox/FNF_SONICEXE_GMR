// activate dev mode
if (global.chaCurrent != "") { exit; }

if (instance_exists(objDevMode)) instance_destroy(objDevMode);
else instance_create_depth(x, y, depth, objDevMode);