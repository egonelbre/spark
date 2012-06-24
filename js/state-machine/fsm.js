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

// TODO: encapsulate inside Machine
// convenience functions
function state(func){
	if(typeof func === "function"){
		return function(m, s){
			if(s !== "update") return;
			func(m);
		};
	} else if (typeof func === "object"){
		return function(m, s){
			var f = func[s];
			if(typeof f === "function")
				f.call(func, m);
		}
	} else {
		throw { msg: "unable to construct state", object: func };
	}
}

function states(st){
	var r = {};
	for(var name in st){
		if(!st.hasOwnProperty(name)) continue;
		r[name] = state(st[name]);
	}
	return r;
}