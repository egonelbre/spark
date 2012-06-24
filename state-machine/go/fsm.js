function Machine(){
	this.cur  = function(m,s){};
	this.next = null;
}

Machine.prototype.update = function(){
	var m = this;
	if( m.next != null ){
		m.cur(m, "exit");
		m.cur = m.next;
		m.next = null;
		m.cur(m, "enter");
	}
	m.cur(m, "update");
};

// convenience function for creating state function
Machine.state = function(obj){
	if(typeof obj === "function"){
		return function(m, s){
			if(s !== "update") return;
			obj(m);
		};
	} else if (typeof obj === "object"){
		return function(m, s){
			var func = obj[s];
			if(typeof f === "function")
				func.call(obj, m);
		}
	} else {
		throw { msg: "unable to construct state", object: obj };
	}
}

// convenience function for creating multiple state functions
Machine.states = function(states){
	var r = {};
	for(var name in states){
		if(!states.hasOwnProperty(name))
			continue;
		r[name] = state(states[name]);
	}
	return r;
}