global.hp = 50;
global.hpMinimum = 0;
displayHpMin = global.hpMinimum;
hpMax = 100;
hiddenScore = global.curScore;
lastFrameWindow = 0;

arrowsX = 0;
arrowsY = 0;

healthXOff = 601;
healthYOff = 10;
outlineWidth = 5;

if (global.downScroll) y = 60;

hpBackColor = c_black;
hpEmptyColor = c_red;
hpColor = c_lime;


missCount = 0;
hitCount = 0;

bpmTimer = 0;
iconBop = 0;
iconBopVsp = 0;

hudSurf = surface_create(1280, 720);
hudTimer = 0;
hudBop = 0;

surf_arrows = surface_create(1280, 720);

hudAlpha = 0;
hudAlphaTarget = 1;
hudAlphaSpd = 0.01;

if (global.songData[$ "player2"] == "gold") hudAlphaTarget = 0;
