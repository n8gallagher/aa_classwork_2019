const readline = require('readline');
const reader = readline.createInterface({
    // it's okay if this part is magic; it just says that we want to
    // 1. output the prompt to the standard output (console)
    // 2. read input from the standard input (again, console)

    input: process.stdin,
    output: process.stdout
});


let askIfGreaterThan = function(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}?`, function (getResponse) {
        if (getResponse === 'yes') {
            callback(true);
        } else {
            callback(false);
        }
    });
}

let innerBubbleSortLoop = function(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], function(bool) {
            if (bool) {
                let temp = arr[i]
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                madeAnySwaps = true;
                innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
            }
            else{
                innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
            }
        });
    }
    if (i === (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    }
}




function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps) {
            madeAnySwaps = false
            innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
        }
        else {
            sortCompletionCallback(arr);
        }
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
    }
    outerBubbleSortLoop(true);
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});


// askIfGreaterThan(1,2, e => console.log("success"))
// let arr = [3,5,6,1,12]

// innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);