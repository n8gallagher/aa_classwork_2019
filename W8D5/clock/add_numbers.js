
const readline = require('readline');
// const addNumbers = function(...numbers) {
//     let sum = numbers.reduce((total, num) => total + num); 
//     console.log(sum);
// }
// addNumbers(1,2,3,4,5);
const reader = readline.createInterface({
    // it's okay if this part is magic; it just says that we want to
    // 1. output the prompt to the standard output (console)
    // 2. read input from the standard input (again, console)

    input: process.stdin,
    output: process.stdout
});

const addNumbers = function(sum, numsLeft, completionCallback) {
    // debugger;
    if (numsLeft === 0) { 
        completionCallback(sum); //beacuse we're using recursion this should only execute after numsLeft is 0
        console.log(`${sum} no nummbers left.`);
        return
    }
    reader.question("Enter a number", function (getNumber) {
        sum += parseInt(getNumber);
        numsLeft--;
        addNumbers(sum, numsLeft, completionCallback); //lines 26/27 need to be inside here
    });
}

addNumbers(0, 3, function(sum) { 
    console.log(`Total Sum: ${sum}`);
    reader.close();
});

// console.log("Last program line");