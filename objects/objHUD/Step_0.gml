

if (bpmTimer >= 120)
{
	iconBopVsp = 0;
	iconBop = 0.2;
	bpmTimer = 0 + (bpmTimer - 120);
}
if (hudTimer >= 120)
{
	hudBop = 0.02;
	hudTimer = 0;
}
bpmTimer += (global.bpm / 60) * DTM;
hudTimer += ((global.bpm / 60) / 4) * DTM;

iconBop = lerp(iconBop, 0, 0.1 * (global.bpm / 60) * DTM);
hudBop = lerp(hudBop, 0, 0.1 * (((global.bpm / 60) / 4) * DTM));
hudAlpha = lerp(hudAlpha, hudAlphaTarget, hudAlphaSpd * DTM);


iconBopVsp += 0.02;
displayHpMin = lerp(displayHpMin, global.hpMinimum, 0.02);
