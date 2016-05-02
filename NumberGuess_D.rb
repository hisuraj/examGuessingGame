#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
	def display_greeting
		Console_Screen.cls
		print "\t\t Welcome to the Ruby Number Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
		"continue."

		Console_Screen.pause
	end

	def display_instruction
		Console_Screen.cls
		puts "Instruction:\n\n"

		puts "This game randomly generates a number from 1 to 1000 and "
		puts "challaenges you to identify it in as few guesses and possible "
	end

	def generate_number
		return randomNo = 1 + rand(1000)
	end
		
	

	def play_game(gamecnt, avg_attempt)
		number = generate_number
		
		total_attempt = avg_attempt*gamecnt
		
		currentattempt = 0
		gamecnt = gamecnt + 1
		loop do
			Console_Screen.cls
			print "\nEnter your guess and press the enter key"
			
			currentattempt = currentattempt + 1
			reply = STDIN.gets
			reply.chop!
			reply = reply.to_i
			
			if currentattempt == 10 then
				Console_Screen.cls
				puts "Sorry you exceded maximum attempt allowed. Exceeded ten times."
				Console_Screen.pause
				break
			end
			
			if reply < 1 or reply > 1000 then
				Console_Screen.cls
				puts "Please provide valid integer between 1 and 1000 ."
				redo # redo the ciurrent iteration of the loop
			end

			if reply == number then
				Console_Screen.cls
				print "You have guessed the number! Press Enter to continue."
				Console_Screen.pause
				break
			elsif reply < number then
				Console_Screen.cls
				print "Your guess is too low! Press enter to continue."
				Console_Screen.pause
			elsif reply > number then
				Console_Screen.cls
				print "Your guess is too high! Press enter to continue."
				Console_Screen.pause
			end
		end
		total_attempt = total_attempt + currentattempt
		avg_attempt = total_attempt/gamecnt
		puts "Game count:  #{gamecnt}  and Average attempt: #{avg_attempt}"
		return gamecnt, avg_attempt
	end

	def display_credits
		Console_Screen.cls
		puts "\t\t\Thanks you for playing the number game!!"
	end

	$noRight = 0

	Console_Screen = Screen.new

	SQ = Game.new

	SQ.display_greeting

	answer = ""

	loop do
		Console_Screen.cls
		
		$attempt = 0

		print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

		answer = STDIN.gets

		answer.chop!

		break if answer == "y" || answer == "n"
	end

	if answer == "n"

		Console_Screen.cls

		puts "Perhaps anoher time.\n\n"

	else
		SQ.display_instruction
		$count = 0;
		$average = 0;
		loop do
			$count, $average = SQ.play_game($count,$average)
			Console_Screen.cls

			print "Would you like to play again? (y/n): "

			playAgain = STDIN.gets
			playAgain.chop!

			break if playAgain == "n"
		end

		SQ.display_credits

	end

end


