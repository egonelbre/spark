function Log(){
    this.enabled = {};
};

Log.prototype.log = function(name, data){
    if( this.enabled[ name ] ){
        console.log( name, ": ", data );
    }
}

Log.prototype.create = function(name, enabled){
    var logger = this;
    if( typeof logger[name] !== "undefined" )
        throw "Cannot use name : " + name + ". Already in use.";

    logFun = function(){ logger.log( name, arguments ); };
    logFun.enable = function(){ logger.enable(name); };
    logFun.disable = function(){ logger.disable(name); };
    logger[name] = logFun;
    logger.enabled[name] = enabled || false;
};

Log.prototype.init = function(names, enabled){
    for(var i = 0; i < names.length; i += 1)
        this.create(names[i], enabled);
};

Log.prototype.enable = function(name){
    this.enabled[name] = true;
};

Log.prototype.disable = function(name){
    this.enabled[name] = false;
};

log = new Log();
log.init(["physics"])

log.physics.enable();
log.physics("1", 2, 3);
log.physics.disable();
log.physics("1", 2, 3);

// local alias
lg = log.physics;
lg("alpha", 1, 2, 3)