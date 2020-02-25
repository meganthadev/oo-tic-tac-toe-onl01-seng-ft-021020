require 'pry'
class TicTacToe

	WIN_COMBINATIONS = [	[ 0, 1, 2 ], 
				[ 3, 4, 5 ],
				[ 6, 7, 8 ],
				[ 0, 4, 8 ], 
				[ 2, 4, 6 ],
				[ 0, 3, 6 ], 
				[ 1, 4, 7 ],
				[ 2, 5, 8 ]  ]

	def initialize(board = nil)
		@board = board || @board = Array.new(9, " ")
	end

	def display_board
		puts " #{@board[0] } | #{@board[1] } | #{@board[2] } " 
		puts "-----------"
		puts " #{@board[3] } | #{@board[4] } | #{@board[5] } " 
		puts "-----------"
		puts " #{@board[6] } | #{@board[7] } | #{@board[8] } " 
	end

	def input_to_index(index)
		@index = index.to_i - 1
	end

	def move(index, character = "X")
		index = input_to_index(index)
		@board[index-1] = character
	end

	def position_taken?(index)
	  !(@board[index].nil? || @board[index] == " ")
	end

	def valid_move?(index)
		index.between?(0,8) && !position_taken?(index.to_i)
	end

	def turn
		puts "Please enter 1-9:"
		index = gets.strip
		if valid_move?(index) 
		  move(index, current_player) 
	  	display_board
	  	else 
	  	  turn 
	  	end
	end

	def turn_count
		@board.count{ |x| x if x == "X" || x == "O" }
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"	
	end

	def won? 
		win_combination = WIN_COMBINATIONS.find { |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"}
	end

	def full?
		@board.all? { |position| position == "X" || position == "O" } 	
	end

	def draw?
		!won? && full? ? true : false
	end

	def over?
		won? || full? || draw? ? true : false
	end

	def winner
		combo = won?
		combo != nil ? @board[combo[0]] : nil 
	end

	def play
    
		while over? == false
		turn
		end

		if (draw? == true) 
		puts "Cat's Game!"
		else puts "Congratulations #{winner}!"
		end 
	end
end