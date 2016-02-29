require_relative 'requires'

puts "\n==========Enter Commands==========\n"
puts "\n==========One in each line==========\n"
puts "\n==========Exit by entering -1 ==========\n"
cmd   = Command.new

$table = TableTop.new
while(commands = gets)
	break if commands.to_i == -1
	
	cmd.parse_command(commands)
	

end
