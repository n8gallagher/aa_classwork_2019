module Slideable
    HORIZONTAL_DIRS = [[1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
                         [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
                            [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1],
                                [-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0]]                       
    DIAGONAL_DIRS = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                        [-7, -7], [-6, -6], [-5, -5], [-4, -4], [-3, -3], [-2, -2], [-1, -1]]

    def horizontal_dirs

    end

    def diagonal_dirs

    end

    def moves
        all_moves = []
        self.move_dirs.each do |key, val|
            if key == :h && val == true
               all_moves += HORIZONTAL_DIRS
            end
            if   key == :d && val == true
                all_moves += DIAGONAL_DIRS
            end
        end
        all_moves
        
        all_positions = all_moves.map {|move| [move[0] + self.position[0], move[1] + self.position[1]] } 
        all_positions = all_positions.select { |pos| @board.valid_pos?(pos) }

        blocked_positions = -1
        all_positions.each_with_index do |pos, i|
            if @board[pos].color == self.color
                blocked_positions = i 
                break
            end
        end
        unblocked_moves = all_moves[0...blocked_positions]
    end

    def move_dirs
        { :h => false, :d => false }
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        
    end
end