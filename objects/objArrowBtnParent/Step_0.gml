if (global.dead) exit;

if !(afterCreate) {
	if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) spr = asset_get_index(sprite_get_name(spr) + "Pixel");
	sprHit = asset_get_index(sprite_get_name(spr) + "Hit");
	sprite_index = spr;
	afterCreate = true;	
}
var controllerKey;
switch (key) {
	case vk_left: controllerKey = gp_padl; altKey = global.leftKeybind; break;
	case vk_right: controllerKey = gp_padr; altKey = global.rightKeybind; break;
	case vk_up: controllerKey = gp_padu; altKey = global.upKeybind; break;
	case vk_down: controllerKey = gp_padd; altKey = global.downKeybind; break;
}

if !(enemy) && !(global.auto)
{
	if (keyboard_check_pressed(key))
		|| (keyboard_check_pressed(altKey))
		|| (gamepad_button_check_pressed(global.controller, controllerKey))
	{
		image_speed = 1;
		image_index = 0;
		
		if (global.ghostTapping)
		{
			objBoyfriend.missed = false;
		}
		else
		{
			objBoyfriend.missed = true;
		}
		
		// jack handling
		var notesHit = instance_place_list(x, y, objNote, notesHitList, true);
		var currentNote = instance_place(x, y, objNote);
		//show_debug_message(notesHit);
		//for (var i = 0; i < ds_list_size(notesHitList); i++)
		//{
		//show_debug_message(notesHitList[| i]);
		//}
		if (notesHit > 0)
		{
			currentNote = notesHitList[| 0];
		}
		// ---
		
		var noteHitInRange = collision_line(x, y - 192, x, y + 192, objNote, false, true);
		if (global.ghostTapping and !instance_exists(currentNote) and bool(noteHitInRange))
		{
			objBoyfriend.missed = true;
			instance_destroy(noteHitInRange);
		}
		
		if (instance_exists(currentNote))
		{
			with (currentNote)
			{
			
				if !(notRealNote)
				{
					if (instance_exists(objCamera))
					{
						objCamera.xTapOffset = other.xOffsetTap;
						objCamera.yTapOffset = other.yOffsetTap;
					}
					with (other)
					{
						sprite_index = sprHit;
					}
					if (sliderLength <= 0)
					{
						instance_destroy();
					}
					else
					{
						beingHeld = true;
						keyPressedWith = other.key;	
						altkeyPressedWith = other.altKey;	
					}
					global.hp += 1;
					objBoyfriend.missed = false;
					global.playVoice = 1;
					
					var distance = point_distance(x, y, other.x, other.y);
					var scor = 0;
					
					// may change hit timings
					if (distance > 48) scor = 1;
					if (distance > 73) scor = 2;
					if (distance > 104) scor = 3;
					var scoreX = 1259
					var scoreY = 485;
					if (instance_exists(objGirlfriend)) {scoreX = objGirlfriend.x + 5; scoreY = objGirlfriend.y - 517};
					if (global.downScroll) scoreY += 200;
					var o = instance_create_depth(scoreX, scoreY, 400 - instance_number(objScoreText), objScoreText);
					o.image_index = scor;
				
					var scoreAdd = 350;
					if (scor = 1) scoreAdd += 200;
					if (scor = 2) scoreAdd += 100;
					if (scor = 3) scoreAdd += 50;
					global.curScore += scoreAdd * global.currentMultiplier;
				
					if (global.particles) && (scor = 0) {
						var o = instance_create_depth(x, y, depth - 100, objSickParticle);
						o.sprite_index = choose(sprParticleLeft1,  sprParticleLeft2);
						if (image_index = 1) o.sprite_index = choose(sprParticleDown1,  sprParticleDown2);
						if (image_index = 2) o.sprite_index = choose(sprParticleUp1,  sprParticleUp2);
						if (image_index = 3) o.sprite_index = choose(sprParticleRight1,  sprParticleRight2);
					
						o.x = other.x;
						o.y = other.y;
					}
				
					global.combo++;
					objHUD.hitCount += 1;
					//global.camZoom += 0.01;
					objHUD.lastFrameWindow = distance;
					if (y < other.y) objHUD.lastFrameWindow = -objHUD.lastFrameWindow
				}
			}
		}
		ds_list_clear(notesHitList);
		
		
		if (objBoyfriend.missed)
		{
			audio_play_sound(asset_get_index("missnote" + choose("1", "2", "3")), 10, false);
			global.hp -= 2;	
			global.playVoice = 0;
			global.curScore -= 10 * global.currentMultiplier;
			global.combo = 0;
			objHUD.missCount += 1;
			
			if (global.fragile) global.hp = 0;
		}
	}

	if (keyboard_check_released(key)) ||
		(keyboard_check_released(altKey)) ||
		(gamepad_button_check_released(global.controller, controllerKey))
	{
		image_index = 1;
		sprite_index = spr;
	}

	if (keyboard_check(key)) || (keyboard_check(altKey))
	|| (gamepad_button_check(global.controller, controllerKey))
	{
		if (image_index >= sprite_get_number(sprite_index) - 2) image_index = sprite_get_number(sprite_index) - 2;
	}
}

var noteCol = instance_place(x, y - 85, objNote);
if (bool(noteCol))
{
	if (enemy) or (global.auto)
	{
		if (noteCol.notRealNote) exit;
		if (noteCol.curNoteSpeed = 0) && (instance_exists(objReady)) exit;
		if (instance_exists(objCamera))
		{
			objCamera.xTapOffset = xOffsetTap;
			objCamera.yTapOffset = yOffsetTap;
		}
		
		var obj = objEnemy;
		if (global.enemy = 0) obj = objGirlfriend;
		if (x > 1280 / 2) obj = objBoyfriend;
		obj.dir = noteCol.image_index;
		obj.animationTimer = 70 + noteCol.sliderLength / 8;
		
		if (noteCol.sliderLength <= 0)
		{
			instance_destroy(noteCol);
			obj.holdAnimation = false;
			obj.animationIndex = 0;
			if (instance_exists(objEnemy))
			{
				global.hp -= objEnemy.healthDrain;
				if (!objEnemy.healthDrainCanKill)
				{
					global.hp = max(global.hp, 1);
				}
			}
		}
		else
		{
			if (global.auto) && !(enemy)
			{
				noteCol.heldAlready = true;
				noteCol.sliderLength -= global.noteSpeed * global.deltaMultiplier;
				noteCol.curNoteSpeed = 0;
				obj.holdAnimation = true;
			}
			else
			{			
				noteCol.enemyHeld = true;
				obj.holdAnimation = true;
				if (instance_exists(objEnemy))
				{
					global.hp -= objEnemy.healthDrain / 10;
					if (!objEnemy.healthDrainCanKill)
					{
						global.hp = max(global.hp, 1);
					}
				}
			}
		}
		
		sprite_index = sprHit;
		image_speed = 1;
		
		if (obj = objBoyfriend)
		{
			if (noteCol.sliderLength > 0) exit;
			// fake the game being played lol
			global.curScore += 350 * global.currentMultiplier;
			global.hp += 1;
			global.combo++;
			
			var o = instance_create_depth(1254, 485, 400 - instance_number(objScoreText), objScoreText);
			o.image_index = 0;
		}
		else
		{
			
		}
	}
}
