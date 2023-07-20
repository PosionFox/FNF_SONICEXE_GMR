// when this object is destroyed, resume the song and reactivate all objects
if (global.audioSyncGroup)
{
	audio_resume_sync_group(global.musicSync);
}
else
{
	audio_resume_sound(global.songId);
	audio_resume_sound(global.voicesId);
}
instance_activate_all();
if (instance_exists(objEnemy))
{
	objEnemy.onUnpause();
}
