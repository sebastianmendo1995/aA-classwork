Array.prototype.myEach = function(callback) {
  this.forEach( el => callback(el) );
};


Array.prototype.myMap = function(callback) {
  let arr = [];
  arr.push(this.myEach(callback));
  return arr;
};

Array.prototype.myReduce = function(callback, initialValue){
  let i;
  if (initialValue) {
    i = 0;
  } else {
    initialValue = this[0];
    i = 1;
  }
  
  for(i; i < this.length; i++){
    initialValue = callback(initialValue, this[i]);
  }
  return initialValue;
};




