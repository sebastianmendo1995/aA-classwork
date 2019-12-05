Array.prototype.bubbleSort = function () {
  let sorted = false;
  while (!sorted){
    sorted = true;
    for(let i=0; i< this.length; i++){
      if (this[i] > this[i+1]){
        [this[i], this[i + 1]] = [this[i+1], this[i]];
        // let temp = this[i];
        // this[i] = this[i + 1]; 
        // this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.substring = function() {
  let subs = [];
  for(let i=0; i < this.length; i++){
    subs.push(this.charAt(i));
    for(let j= i+1; j < this.length; j++){
      subs.push(this.slice(i,j+1));
    }
  }
  return subs;
}

