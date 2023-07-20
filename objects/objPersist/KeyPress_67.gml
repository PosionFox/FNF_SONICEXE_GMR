/// @description 
/*
if (global.chaCurrent != "") { exit; }

if (room != rmTitle) && (room != rmDebug) {
	if (room != rmCharacterSelect) {
		global.roomBefore = room;
		
		var o = instance_create_depth(x, y, -10000, objFade);
		o.roomTo = rmCharacterSelect;
	} else {
		var o = instance_create_depth(x, y, -10000, objFade);
		o.roomTo = global.roomBefore;
	}
}
*/