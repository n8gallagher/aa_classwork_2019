console.log('webpack si working');

const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

// document.getElementById('game-canvas')

const Game = require('./game.js');

window.addEventListener('DOMContentLoaded', (event) => {
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext('2d');
  canvasEl.width = 700;
  canvasEl.height = 500;
  const mi = new MovingObject({
    pos: [30, 30],
    vel: [100, 100],
    radius: 10,
    color: "red"
  });
  mi.draw(ctx);
  
  const my = new MovingObject({
    pos: [150, 190],
    vel: [10, 10],
    radius: 100,
    color: "blue"
  });

  my.draw(ctx);
  mi.move(ctx);
  mi.draw(ctx);
  // my.move(ctx);
  // my.draw(ctx);

});

// const ctx = canvasEl.getContext('2d');

// window.ctx = ctx;