
instance_create_depth(x, y, depth, objSettings);
instance_destroy();
exit;

curSelected = 0;
optionAmount[0] = 6;
optionAmount[1] = 3;
optionAmount[2] = 6;

fullscreenOption = false;
smoothingOption = false;
discord = false;
if (instance_exists(objDiscord)) discord = true;

category = 0;

input = {
	enter : false,
	up : false,
	down : false,
	left : false,
	right : false,
	back : false
}

