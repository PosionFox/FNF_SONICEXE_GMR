if (room != rmTitle) {
	if (room != rmSongImport) {
		global.roomBefore = room;
		
		var o = instance_create_depth(x, y, -10000, objFade);
		o.roomTo = rmSongImport;
	} else {
		var o = instance_create_depth(x, y, -10000, objFade);
		o.roomTo = rmMainMenu;
	}
}