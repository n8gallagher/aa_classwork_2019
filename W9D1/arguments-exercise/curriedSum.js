function sum() {
  const args = Array.from(arguments)
  let sum = 0;
  args.forEach(arg => {
    sum += arg;
  });
  return sum;
};

// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 
//  3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6);

function curriedSum(numArgs) {
  let numbers = [];


  function _curriedSum (num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
        return sum(...numbers);
    }
    else {
      return _curriedSum;
    }
  }


  
  return _curriedSum;
};

const sumz = curriedSum(4);
console.log(sumz(5)(30)(20)(1));