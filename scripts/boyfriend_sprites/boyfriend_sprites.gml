
function boyfriend_sprites() {
	var add = "";
	
	switch (global.boyfriend) {
		case("og"):
			flipped = false;
			char = "sprBoyfriend";
		break;
		
		case("codist"):
			flipped = false;
			char = "sprBoyfriendCod";
		break;
		
		case("christmas"):
			flipped = false;
			char = "sprBoyfriendChrist";
		break;
		
		case("car"):
			flipped = false;
			char = "sprBoyfriendCar";
		break;
		
		case ("dad"):
			flipped = true;
			char = "sprDad";
		break;
		
		case("mom"):
			flipped = true;
			char = "sprMom";
		break;
		
		case("spooky twins"):
			flipped = true;
			char = "sprSpooky";
		break;
		
		case("whitty2"):
			flipped = true;
			char = "sprWhittyC";
		break;
		
		case("pixel"):
			char = "sprBoyfriendPixel";
			scale = 6;
			isPixel = true;
		break;
		
		case("tankman"):
			flipped = true;
			char = "sprTankman";
		break;
		
		case("pico"):
			flipped = false; 
			char = "sprPico";
		break;

		default:
			flipped = false;
			char = "sprBoyfriend";
		break;
	}
	
	// if it is the default boyfriend sprite
	if (char == "sprBoyfriend")
	&& (room != rmCharacterSelect) { // then just add an addon
		if (global.enemy = 5) add = "Car";
		if (global.enemy = 6) or (global.enemy = 7) add = "Christ";
		if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) {
			add = "Pixel";
			scale = 6;
			isPixel = true;
		}
		
		if (global.enemy = 102) add = "Cod";
	}

	//sprIdle = asset_get_index(char + add + "Idle");
	//sprLeft = asset_get_index(char + add + "Left");
	//sprDown = asset_get_index(char + add + "Down");
	//sprUp = asset_get_index(char + add + "Up");
	//sprRight = asset_get_index(char + add + "Right");
	
	//sprCheer = sprBoyfriendCheer;
	//sprDeath = sprBoyfriendDie;
	
	if (global.enemy = 102) or (global.boyfriend == "codist") sprCheer = sprBoyfriendCodCheer;
	if (sprite_exists(asset_get_index(char + add + "Die"))) sprDeath = asset_get_index(char + add + "Die");
}