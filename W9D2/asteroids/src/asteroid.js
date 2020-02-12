const MovingObject = require('./moving_object.js');
const Util = require('./util.js');

const DEFAULTS = {
  COLOR: 'purple',
  RADIUS: '13px'
}



function Asteroid(options) {
  options.color = DEFAULTS.COLOR;
  options.radius = DEFAULTS.RADIUS;
  options.vel = Util.randomVec(5);
  MovingObject.call(this, options);
}

Util.inherits(Asteroid,MovingObject);
