# Service to facilitate the Robots Movements

class RobotMove
	def self.move(robot)
		x,y = calculate_position(robot)
		if x!=false
		  if $table.place_robot_on_table(robot,x,y) === true
		     robot.add_to_positions(x,y) 
		  end
		end
		robot
	end
	def self.left(robot)
		current_face = robot.get_robot_current_face
		case current_face
		when 'NORTH'
			robot.set_robot_new_face('WEST')
		when 'SOUTH'
			robot.set_robot_new_face('EAST')
		when 'EAST'
			robot.set_robot_new_face('NORTH')
		when 'WEST'
			robot.set_robot_new_face('SOUTH')
		
		end
		robot
	end
	def self.right(robot)
		current_face = robot.get_robot_current_face
		case current_face
		when 'NORTH'
			robot.set_robot_new_face('EAST')
		when 'SOUTH'
			robot.set_robot_new_face('WEST')
		when 'EAST'
			robot.set_robot_new_face('SOUTH')
		when 'WEST'
			robot.set_robot_new_face('NORTH')
		
		end
		robot
	end
	def self.place(robot,x,y,face)
		robot.add_to_positions(x,y)
		robot.set_robot_new_face(face)
		robot
	end
	
	def self.calculate_position(robot)
		current_x = robot.get_robot_current_x
		current_y = robot.get_robot_current_y
		face      = robot.get_robot_current_face.upcase

		case face
		when 'NORTH'
			return current_x, current_y+1
		when 'SOUTH'
			return current_x, current_y-1
		when 'EAST'
			return current_x+1, current_y
		when 'WEST'
			return current_x-1, current_y
		
		end
	end

end