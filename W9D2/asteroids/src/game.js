const MovingObject = require('./moving_object.js');
const Util = require('./util.js');

const DEFAULTS = {
  DIM_X: 7,
  DIM_Y: 8,
  NUM_ASTEROIDS: 10
};
// const Asteroids = require('./asteroids.js');



function Game() {

}

Game.prototype.randomPosition = function() {
  const xCoord = Math.floor(Math.random() * Math.floor(695));
  const yCoord = Math.floor(Math.random() * Math.floor(695));
  return [xCoord, yCoord];
};

Game.prototype.addAsteroids = function() {
  new Asteroid(options[pos] = randomPosition());
};