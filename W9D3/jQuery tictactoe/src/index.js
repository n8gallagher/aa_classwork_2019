const View = require('./ttt-view.js')
const Game = require('../../node_solution/game.js')

  $(() => {
    let $ttt = $(".ttt")
    // let $ul = $($ttt.find(
    let game = new Game();
    let view = new View(game, $ttt);
    
    $('li').on({
      mouseenter: (event) => {
        $(event.target).toggleClass("hover");
      },
      mouseleave: (event) => {
        $(event.target).toggleClass("hover");
      }
    });
    
    $('ul').on("click", (event) => {
      let $square = $(event.target);
      view.makeMove($square);
    })

  });
