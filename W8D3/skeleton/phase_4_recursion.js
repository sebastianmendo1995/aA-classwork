function range(start, end) {
  if(start === end) return [end];
   return [start].concat(range(start+1, end));
}

function sumRec(arr) {
  if (arr.length <= 1) return arr[0];
  return arr[0] + sumRec(arr.slice(1, arr.length));
}

function exponent(base, exp) {
  if(exp === 0) return 1;
  if (exp === -1) return 1/base ;
  if (exp === 1) return base ;
  if (exp > 1){
    return base * exponent(base,exp-1);
  }
  else{
    return 1/base * exponent(base, exp+1);
  }
}

function fibonacci(n) {
  if(n===1) return [0];
  if(n === 2) return [0,1];
  prev = fibonacci(n - 1);
  return prev.concat(prev[prev.length-1]+prev[prev.length-2]);
}

function deepDup(arr) {
  return arr.map(function(el){
    if (typeof(el) === 'object'){
      return deepDup(el);
    }
    else{
      return el;
    }
  });

}

function bsearch(arr, target){
  if(arr.length <= 1 && arr[0] === target) {
    return 0;
  }
  else if(arr.length <= 1 && arr[0] != target){
    return -1;
  }

  let pivot = Math.trunc(arr.length/2);

  if(arr[pivot] === target) {
    return pivot;
  }else if(arr[pivot] > target){
    return bsearch(arr.slice(0,pivot), target);
  }
  else{
    let prev_ans = bsearch(arr.slice(pivot+1), target);
    if(prev_ans === -1){
      return -1;
    } else {
      return prev_ans + pivot +1 ;
    }
  }


}


