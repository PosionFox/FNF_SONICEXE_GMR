
function prefetchPlayerSprites()
{
	if (os_type != os_operagx and instance_exists(objBoyfriend))
	{
		var _sprites = [objBoyfriend.sprIdle, objBoyfriend.sprLeft, objBoyfriend.sprDown, objBoyfriend.sprUp, objBoyfriend.sprRight];
	
		var _r = sprite_prefetch_multi(_sprites);
		if (_r == 0) { show_debug_message("preloaded player sprites"); }
	}
}

function prefetchOpponentSprites()
{
	if (os_type != os_operagx and instance_exists(objEnemy))
	{
		var _sprites = [objEnemy.sprIdle, objEnemy.sprLeft, objEnemy.sprDown, objEnemy.sprUp, objEnemy.sprRight];
	
		var _r = sprite_prefetch_multi(_sprites);
		if (_r == 0) { show_debug_message("preloaded opponent sprites"); }
	}
}

function flushPlayerSprites()
{
	if (os_type != os_operagx and instance_exists(objBoyfriend))
	{
		var _player = [objBoyfriend.sprIdle, objBoyfriend.sprLeft, objBoyfriend.sprDown, objBoyfriend.sprUp, objBoyfriend.sprRight];
		
		sprite_flush_multi(_player);
	}
}

function flushOpponentSprites()
{
	if (os_type != os_operagx and instance_exists(objEnemy))
	{
		var _opponent = [objEnemy.sprIdle, objEnemy.sprLeft, objEnemy.sprDown, objEnemy.sprUp, objEnemy.sprRight];
		
		sprite_flush_multi(_opponent);
	}
}

/**
 * Prefetches character sprites into memory
 * @param {asset.GMObject,id.instance} char character object
 */
function character_prefetch_sprites(char)
{
	if (os_type != os_operagx and instance_exists(char))
	{
		var sprites = [char.sprites.idle, char.sprites.left, char.sprites.down, char.sprites.up, char.sprites.right];
	
		var result = sprite_prefetch_multi(sprites);
		if (result == 0) { show_debug_message("preloaded character sprites"); }
	}
}

/**
 * Flushes character sprites from memory
 * @param {asset.GMObject,id.instance} char character object
 */
function character_flush_sprites(char)
{
	if (os_type != os_operagx and instance_exists(char))
	{
		var sprites = [char.sprites.idle, char.sprites.left, char.sprites.down, char.sprites.up, char.sprites.right];
		
		sprite_flush_multi(sprites);
	}
}
