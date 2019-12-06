let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const matrix = new Array(8).fill(0).map(() => new Array(8) );
  matrix[3][4] = new Piece('black');
  matrix[4][3] = new Piece('black');
  matrix[3][3] = new Piece('white');
  matrix[4][4] = new Piece('white');
  return matrix;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (!this.isValidPos(pos)){
    throw new Error("Invalid position")
  }
  return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length != 0 ;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos)
  return piece && piece.color === color
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos)
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove('black') && !this.hasMove('white')
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {

  if (!piecesToFlip){
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }

  let next = [ pos[0]+dir[0], pos[1]+dir[1] ];

  if (!board.isValidPos(next)){
    return null;
  }else if(!board.isOccupied(next)){
    return null;
  }else if(board.isMine(next, color)){
    return piecesToFlip.length < 1 ? null : piecesToFlip;
  }else {
    return _positionsToFlip(board, next, color, dir, piecesToFlip);
  }

}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  let positions = [];
  if(!this.validMove(pos,color)){
    throw new Error("Invalid Move")
  }
  for (let i = 0; i < Board.DIRS.length; i++) {
    result = _positionsToFlip(this, pos, color, Board.DIRS[i]);
    if (result){
      positions = positions.concat(result);
    }
  }
  
  this.grid[pos[0]][pos[1]] = new Piece(color);
  for(let i=0; i < positions.length; i++){
    this.getPiece(positions[i]).flip();
  } 


};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log(`  ͟0͟ ͟1͟ ͟2͟ ͟3͟ ͟4͟ ͟5͟ ͟6͟ ͟7͟`)
  for(let i=0; i < 8; i++){
    let row = `${i}|` ;
    for(let j=0; j < 8; j++){
      let pos = [i,j];
      if (this.getPiece(pos)){
        row += `${this.getPiece(pos).toString()}|`
      }else{
        row += "_|"
      }
    }
    console.log(row)
  }

    
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {

  if (this.isOccupied(pos)) return false;

  for(let i=0; i < Board.DIRS.length; i++){
    let positions = _positionsToFlip(this, pos, color, Board.DIRS[i]);
    if (positions) return true
  };


  return false;

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const validMovesList = [];

  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i, j], color)) {
        validMovesList.push([i, j]);
      }
    }
  }

  return validMovesList;
};

module.exports = Board;
