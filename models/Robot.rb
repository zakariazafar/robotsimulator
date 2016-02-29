# Robot Object. A Robot has Many RobotPositions
class Robot
	def initialize(id,name)
		@robot_id      = id
		@robot_name    = name
		
		@current_face  = nil
		@positions     = []
		
	end
	def get_robot_id
		@robot_id
	end
	def get_robot_name
		@robot_name
	end
	def get_robot_current_x
		@positions.length == 0 ? nil : @positions[@positions.length-1].get_x
	end
	def get_robot_current_y
		@positions.length == 0 ? nil : @positions[@positions.length-1].get_y
	end
	def get_robot_current_face
		@current_face
	end
	def set_robot_new_face(face)
		@current_face = face
	end
	def add_to_positions(x,y)
		
		@positions << RobotPositions.new(x,y)
	end
	def get_positions
		@positions
	end
end
