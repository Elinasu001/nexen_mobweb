
// javascript Map prototype
Map = function() {
	this.map = new Object();
};
Map.prototype = {
    put : function(key, value) {
    	this.map[key] = value;
    },
    putMap : function(key, value) {
    	this.map[key] = value.map;
    },
    putMapList : function(key, value) {
    	var list = new Array();
    	for(var i=0;i<value.length;i++) {
    		list.push(value[i].map);
    	}
    	this.map[key] = list;
	},
	putList : function(key, value) {
    	this.map[key] = value.list;
	},
    get : function(key) {
    	return this.map[key];
    },
    containsKey : function(key) {
    	return key in this.map;
    },
    containsValue : function(value) {
    	for(var prop in this.map) {
    		if(this.map[prop] == value) return true;
    	}
    	return false;
    },
	isEmpty : function(key) {
		return (this.size() == 0);
    },
    clear : function() {
    	for(var prop in this.map) {
    		delete this.map[prop];
    	}
    },
    remove : function(key) {
    	delete this.map[key];
    },
    keys : function() {
    	var keys = new Array();
    	for(var prop in this.map) {
        	keys.push(prop);
    	}
    	return keys;
    },
    values : function() {
    	var values = new Array();
    	for(var prop in this.map) {
        	values.push(this.map[prop]);
    	}
    	return values;
    },
	size : function() {
		var count = 0;
		for (var prop in this.map) {
			count++;
		}
		return count;
	},
    jsonString: function(){
    	return JSON.stringify(this.map);
    },
    jsonParse: function(){
    	return JSON.parse(JSON.stringify(this.map));
    }
};

// javascript List prototype
List = function() {
	this.list = [];
	this.pos = 0;
	this.len = 0;
};
List.prototype = {
	append: function(element) {
		this.list[this.len] = element;
		this.len++;
	},
	find: function(element) {
		for(var i=0; i<this.len; i++) {
			if(this.list[i] === element) {
				return i;
			}
		}
		return -1;
	},
	remove: function(element) {
		var removePos = this.find(element);

		if(removePos > -1) {
			this.list.splice(removePos, 1);
			this.len--;
			return true;
		}
		return false;
	},
	removePos: function(removePos) {
		if(removePos > -1) {
			this.list.splice(removePos, 1);
			this.len--;
			return true;
		}
		return false;
	},
	length: function() {
		return this.len;
	},
	toString: function() {
		return this.list;
	},
	currPos: function() {
		return this.pos;
	},
	getElement: function() {
		return this.list[this.pos];
	},
	jsonString: function(){
    	return JSON.stringify(this.list);
    }
};

