
function MovingObject(options) {
  const pos = options.pos;
  const vel = options.vel;
  const radius = options.radius;
  const color = options.color;
  this.pos = pos;
  this.vel = vel;
  this.radius = radius;
  this.color = color;
} 

MovingObject.prototype.move = function() {
 this.pos += [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];
};

MovingObject.prototype.draw = function(ctx) {
//  ctx.radius = this.radius;
 this.centerX = this.pos[0];
 this.centerY = this.pos[1];
 ctx.fillStyle = this.color;
 ctx.beginPath();
  ctx.arc(
    this.centerX,
    this.centerY,
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
};

MovingObject.prototype.isCollidedWith = function(otherMovingObject) {
 
};

module.exports = MovingObject;