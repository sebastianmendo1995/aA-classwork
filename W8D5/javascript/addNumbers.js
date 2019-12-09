const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0) {
    reader.question("Enter a number:", function(answer){
      number = parseInt(answer);
      sum += number;
      addNumbers(sum, numsLeft - 1, completionCallback );
    });
  }
  else {
    // console.log(sum);
    completionCallback(sum);
  }
}

// addNumbers(0, 3,function(sum){
//   console.log(`Total Sum: ${sum}`);
//   reader.close();
// });

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));