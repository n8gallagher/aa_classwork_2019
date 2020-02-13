class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.coords = {
      "0": [0, 0],
      "1": [0, 1],
      "2": [0, 2],
      "3": [1, 0],
      "4": [1, 1],
      "5": [1, 2],
      "6": [2, 0],
      "7": [2, 1],
      "8": [2, 2]
    };
  }
 

  bindEvents() {
    // $('li').on("click", (event) => {
    //     this.game.playMove()
    //   }
    // });
    // this.game.board
  }

  makeMove($square) {
    let pos = this.coords[$square.attr('id')]
    this.game.playMove(pos);
    $square.toggleClass("move");
    $square.html(this.game.currentPlayer)
  }

  setupBoard() {
    let $ul = $("<ul>");
    // let $li = $("<li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>");
    for (let i = 0; i < 9; i++) {
      // debugger;
      let $li = $(`<li id=${i}></li>`)
      $ul.append($li);
    };
    this.$el.append($ul);
  }
}

module.exports = View;