# A service to facilitate the print related commands
class Print
	def self.current_position(robot)
		puts "\n"+robot.get_robot_current_x.to_s+", "+robot.get_robot_current_y.to_s+", "+robot.get_robot_current_face+"\n"
	end
	def self.trace(robot)
		positions = robot.get_positions
		if positions.length <=1 then
			puts "\nRobot did not move\n" 
		else
			for i in 0...(positions.length-1)

				puts "\n"+" (#{positions[i].get_x},#{positions[i].get_y}) "+" ->" + " (#{positions[i+1].get_x},#{positions[i+1].get_y}) "+"\n"
			end
	    end
	end
end