function sum (...arguments) {
  const args = Array.from(arguments)
  let sum = 0;
  args.forEach(arg => {
   sum += arg;
  });
  console.log(sum);
};

// function sum () {
//   const args = Array.from(arguments)
//   console.log(arguments[2])
  
// }



sum(1, 2, 3, 4) // === 10;
sum(1, 2, 3, 4, 5) // === 15;