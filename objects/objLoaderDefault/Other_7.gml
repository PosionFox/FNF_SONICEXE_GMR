
if (is_loading)
{
	currentSprite++;
	if (currentSprite >= array_length(spritesToLoad))
	{
		ready = true;
		is_loading = false;
	}
}
