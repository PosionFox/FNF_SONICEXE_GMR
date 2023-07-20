// create the notes depending on the current loaded map
// i hate this script so much why does it work why does it work why does it work
function create_notes(noteGrid)
{
	for (var h = 0; h < ds_grid_height(noteGrid); ++h)
	{
		for (var w = 0; w < ds_grid_width(noteGrid); ++w)
		{
			if (ds_grid_get(noteGrid, w, h) != 0)
			{
				
				// get the y the note is needed to be created at using bullshit math
				var noteY = ((h * (global.noteSpeed + (0.01*h*global.accelnotes))) * (100 / (global.camSpeed / 48))) + global.offset;
				var noteX = 745;
				
				// choose the x position for the notes
				switch (w)
				{
					// left side
					case 0: noteX = 102; break;
					case 1: noteX = 216; break;
					case 2: noteX = 330; break;
					case 3: noteX = 438; break;
					// right side
					case 4: noteX = 745; break;
					case 5: noteX = 856; break;
					case 6: noteX = 968; break;
					case 7: noteX = 1081; break;
				}
				if (global.flipped)
				{ // if the flipped mod is on, change the note positions
					switch (w)
					{
						case 4: noteX = 1081; break;
						case 5: noteX = 968; break;
						case 6: noteX = 856; break;
						case 7: noteX = 745; break;
					}
				}
				if (instance_exists(objEnemy))
				{
					if (objEnemy.hideArrows and w <= 3)
					{
						noteY += 1000;
					}
				}
				
				// create the note
				var n = instance_create_layer(noteX, 103 + noteY, "Notes", objNote);
				n.noteRangeDetermine = h;
				
				
				
				// get the notes value from the grid
				var val = ds_grid_get(noteGrid, w, h);
				if (val > -1) && (val < 1) n.yOff = (1 - val) * 50;
				//if (val > 1) n.sliderLength = val * 10;
				if (val > 1) n.sliderLength = (val - 1) / 10;
				
				// -1 = camera switch, -2 - bf hey animation, -3 - use the alternate enemy animation (week 5)
				if (val = -1) n.switchTurn = true;
				if (val = -2) n.bfHey = true;
				if (val = -3) n.useAlt = true;
				if (val = -4) n.goldDmg = true;
				
				// make the not unable to be hit if its not a real note
				if (val <= -1) n.notRealNote = true;
			}
		}
	}
}


function create_notes_v2()
{
	show_debug_message("create_notes_v2")
	notesFinished = false

	var tempArray = []
	var sectionArray = []
	var lastNote = undefined;
	
	var sections = []
	var events = []
	
	var bpm = global.songData.bpm;
	
	for (var i = 0, n = array_length(global.songData.notes); i < n; i++)
	{
		var section = global.songData.notes[i];
		var sectionTime = (((60 / bpm) / 4) * 16) * array_length(sections);
		
		var altAnim = false;
		if (section[$ "altAnim"] != undefined) altAnim = true;
		
		var sectionData = [sectionTime, section[$ "mustHitSection"], altAnim];
		
		array_push(sections, sectionData);
		
		for (var j = 0, m = array_length(section[i].sectionNotes); j < m; j++)
		{
			var note = section[i].sectionNotes[j];
			var strumTime = (note[0]) / 1000;
			var strumLane = real(note[1]);
			var sustainLength = real(note[2]) / 1000.0;
			
			var arg3 = undefined;
			if (array_length(note) > 3) arg3 = note[3];
			
			if (!section[$ "mustHitSection"])
			{
				if (strumLane <= 3) strumLane += 4;
			}
			else
			{
				strumLane -= 4;
			}
			
			var noteData = [strumTime, strumLane, sustainLength, arg3];
			
			if (lastNote != undefined)
			{
				array_push(tempArray, lastNote);
				if (!array_equals(sectionArray, []))
				{
					array_push(tempArray, sectionArray);
					sectionArray = [];
				}
				lastNote = noteData;
			}
			else
			{
				lastNote = noteData;
			}
		}
		if (section[$ "sectionEvents"] != undefined)
		{
			for (var k = 0, o = array_length(section[$ "sectionEvents"]); k < o; k++)
			{
				var event = section[$ "sectionEvents"][k];
				var eventData = [event[0] / 1000, event[1], event[2], event[3]];
				array_push(events, eventData);
			}
		}
	}
	array_push(tempArray, lastNote);
	
	// sort notes
	var notes = [];
	if (array_length(tempArray) > 1 and tempArray[0] != undefined)
	{
		var strumTimes = [];
		
		for (var i = 0, n = array_length(tempArray); i < n; i++)
		{
			var tempNote = tempArray[i];
			array_push(strumTimes, tempNote[0]);
		}
		array_sort(strumTimes, false);
		
		while (array_equals(tempArray, []))
		{
			var index = 0;
			while (strumTimes[0] != tempArray[index][0])
			{
				index++;
			}
			array_push(notes, tempArray[index]);
			array_delete(strumTimes, 0, 1);
			array_delete(tempArray, index, 1);
		}
	}
	
	//sort events
	var sortedEvents = [];
	for (var i = 0, n = array_length(events); i < n; i++)
	{
		var event = events[i];
		array_push(sortedEvents, event[0]);
	}
	array_sort(sortedEvents, false);
	var trueSortedEvents = [];

	for (var i = 0, n = array_length(sortedEvents); i < n; i++)
	{
		var sortedEvent = sortedEvents[i];
		for (var j = 0, m = array_length(events); j < m; j++)
		{
			var event = events[j];
			if (event[0] = sortedEvent) array_push(trueSortedEvents, event);
		}
	}
	
	notesFinished = true
}



