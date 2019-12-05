Array.prototype.uniq = function() {
  let ans = [];
  this.forEach( el => {
    if (!ans.includes(el)){
      ans.push(el);
    }
  });
  return ans;
}


Array.prototype.twoSum = function () {
  let ans = [];
  
  for( let i =0; i < this.length-1; i++) {
    for(let j = i +1; j < this.length; j++){
      if(this[i] + this[j] === 0){
        ans.push([i,j]);
        break;
      }
    }
  }
  return ans;
}

Array.prototype.transpose = function () {
  let ans = [];
  let min = 99;
  let temp = [];
  this.forEach( arr => {
    if (min > arr.length){
      min = arr.length;
    }
  });
  
  for(let j=0; j < min; j++){
    temp = [];
    for (let i = 0; i < this.length; i++) {
      temp.push(this[i][j]);
    }
    ans.push(temp);
  }
  return ans;
}