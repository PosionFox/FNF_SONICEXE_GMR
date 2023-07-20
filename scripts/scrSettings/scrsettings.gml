
function Category(_name, _desc = "", _callback = function() {}) constructor
{
	name = _name;
	desc = _desc;
	value = undefined;
	options = [];
	callback = _callback;
	
	static pressRight = function() {}
	static pressLeft = function() {}
	static pressEnter = function()
	{
		callback();
	}
	
	static addSettings = function(_array)
	{
		var _len = array_length(_array);
		for (var i = 0; i < _len; i++)
		{
			array_push(options, _array[i]);
		}
	}
}

function Setting(_name = "option", _desc = "", _var, _cb) constructor
{
	name = _name;
	desc = _desc;
	refVar = _var;
	value = undefined;
	if (variable_global_exists(refVar))
	{
		value = variable_global_get(refVar);
	}
	callback = _cb ?? function() {};
	
	static pressRight = function() {}
	static pressLeft = function() {}
	static pressEnter = function() {}
	
	static getValue = function() { return value; }
}

function SettingBool(_name = "bool", _desc = "", _var, _cb) : Setting(_name, _desc, _var, _cb) constructor
{
	
	static pressEnter = function()
	{
		value = !value;
		if (variable_global_exists(refVar))
		{
			variable_global_set(refVar, value);
		}
		callback();
	}
	static pressRight = function() { pressEnter(); }
	static pressLeft = function() { pressEnter(); }
	
	static getValue = function()
	{
		return bool_to_onoff(value);
	}
}

function SettingInt(_name = "int", _desc = "", _var, _min = 0, _max = 1, _cb) : Setting(_name, _desc, _var, _cb) constructor
{
	thresholdMin = _min;
	thresholdMax = _max;
	
	static pressRight = function()
	{
		if (keyboard_check(vk_shift))
		{
			value += 5;
		}
		else
		{
			value++;
		}
		value = min(value, thresholdMax);
		update_ref();
		callback();
	}
	static pressLeft = function()
	{
		if (keyboard_check(vk_shift))
		{
			value -= 5;
		}
		else
		{
			value--;
		}
		value = max(value, thresholdMin);
		update_ref();
		callback();
	}
	static update_ref = function()
	{
		if (variable_global_exists(refVar))
		{
			variable_global_set(refVar, value);
		}
	}
}

function SettingBind(_name = "bind", _desc = "", _var, _cb) : Setting(_name, _desc, _var, _cb) constructor
{
	static pressEnter = function()
	{
		var o = instance_create_depth(other.x, other.y, -1000, objMapKey);
		o.keyString = name;
		o.globalString = refVar;
		callback();
	}
	
	static getValue = function()
	{
		return string_lower(chr(value));
	}
	static updateKeymap = function()
	{
		if (variable_global_exists(refVar))
		{
			value = variable_global_get(refVar);
		}
	}
}
