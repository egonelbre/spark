var M = new Machine();
// without convenience functions

tick = function(m,s){
	if(s === "update"){
		console.log("updating tick;");
		m.next = tock;
	}
};

tock = function(m,s){
	if(s === "update"){
		console.log("updating tock;");
		m.next = tick;
	} else if(s === "start"){
		console.log("starting tock");
	}
};

// using state constructor
// using single function makes it for update
tick = state(function(m){
	m.next = tock;
});

// you can specify also all other types
tock = state({
	start : function(m){
		console.log("starting tock");
	},
	update: function(m){
		console.log("updating tock");
		m.next = tick;
	}
})

// using states function
// this is for defining multiple states at once
M.$ = states({
	tick : function(m){
		console.log("tick");
		m.next = m.$.tock;
	},
	tock : function(m){
		console.log("tock");
		m.next = m.$.tick;
	}
});


// using states constructor on objects
function Tick(){
	this.msg = "tick";
	this.after = "tock";
}

Tick.prototype.update = function(m){
	console.log("updating" + this.msg);
	m.next = m.$[this.after];
}

function Tock(){
	Tick.call(this);
	this.msg = "tock";
	this.after = "tick";
}

Tock.prototype.start = function(m){
	console.log("entered start in " + this.msg);
}

M.$ = states({
	tick : new Tick(),
	tock : new Tock()
});