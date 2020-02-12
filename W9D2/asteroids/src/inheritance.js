
Function.prototype.myInherits(Child,Parent) {
  const Surrogate = function(){};
  Surrogate.prototype = Parent.prototype;
  Child.prototype = new Surrogate();
  Child.prototype.constructor = Child;
};

