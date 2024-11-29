
function Dialogue() constructor {

	_dialogs = [];
	
	add = function(_message) {
		array_push(_dialogs, _message);	
	}
	
	pop = function() {
		var _t = array_first(_dialogs);	
		array_delete(_dialogs, 0, 1);
		
		return _t;
	}
	
	count = function() {
		return array_length(_dialogs);	
	}

}