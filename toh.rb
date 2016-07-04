class Toh
	attr_accessor :board, :moves

	def initialize()
		@board = [[6,5,4,3,2,1], [], []]
		@moves = 0
	end

	def render
		p self.board[0]
		p self.board[1]
		p self.board[2]
		puts ""
	end

	def start_game
		puts "We are going to play Tower of Hanoi."
		puts "The largest bottom will be 6, and the smallest will be 1."
		puts "In order to win, you must place the numbers, from left to right, 6 to 1"
		puts "on the second or third rod. Good luck!"
		puts "P.S."
		puts "If you want to quit at any time, just type 'quit'"
	end

	def quit_game(input)
		if input == "quit" 
			puts "Thanks for playing!"
			exit
		end
	end

	def ask_choice
		puts "From what rod do you want to move the piece from?"
		start = gets.chomp
		quit_game(start)
		until check_choice(start.to_i)
			start = gets.chomp.to_i
		end
		puts "Where do you want to put it?"
		finish = gets.chomp
		quit_game(finish)
		check_finish(start.to_i, finish.to_i)
	end

	def board_choices
		choices = [1,2,3]
		return choices
	end

	def check_choice(choice)
		if !board_choices.include?(choice)
			puts "That's not a place where a rod is. Pick the first, second or"
			puts "third rod."
			render
			return false
		elsif board[choice - 1].length == 0
			puts "There's nothing there. Pick again"
			render
			return false
		end
		return true
	end

	def check_finish(start, finish)
		if @board[finish - 1].empty? || @board[start - 1][-1] < @board[finish - 1][-1]
			@board[finish - 1].push(@board[start - 1][-1])
			@board[start - 1].pop
			@moves += 1
			p "You have made #{@moves} moves"
		else
			puts "That's not a valid move"
		end
	end
end

new_game = Toh.new()
new_game.start_game
new_game.render
new_game.ask_choice
new_game.render
until new_game.board[1].length == 6 || new_game.board[2].length == 6
	new_game.ask_choice
	new_game.render 
end
puts "Congrats! It took you #{new_game.moves} moves to win!"