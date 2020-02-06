Array.prototype.uniq = function() {
  let arr = [this[0]]
  
  this.forEach(function(el) {
    if (!arr.includes(el)) {
      arr.push(el)

    }
  })

  return arr

};

a = [3, -3, 1, -1, 5, 5]

Array.prototype.twoSum = function() {
  let array = []
  for (let i = 0; i<this.length; i++) {
    for (let j = 1; j<this.length; j++) {
      if ((this[i]+this[j] === 0) && j > i) {
        
        array.push([i, j]);
      }
    }
  }
  return array;
};



let b = [["x", "o"],["x", "o"]] // [["o","x"],["o","x"]]


Array.prototype.transpose = function() {
  let matrix = Array(this.length).fill(this.length);

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      debugger
      matrix[i][j] = this[j][i];
    }
  }

  return matrix;

}







