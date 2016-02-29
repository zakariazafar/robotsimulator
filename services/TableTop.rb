# A blue print of the TableTop
class TableTop
	def initialize
	@width  = 5
	@height = 5
	@table = Array.new(@width){Array.new(@height)}
	end
	
	def is_space_empty(i,j)
		@table[i][j]
	end

	def is_falling(i,j)
		return true if i < 0 || i >= @width
		return true if j < 0 || j >= @height
		return false
	end
	def place_robot_on_table(robot,i,j)

		return false if (!is_space_empty(i,j).nil? || is_falling(i,j) == true)
		
		if !robot.get_robot_current_x.nil?
		@table[robot.get_robot_current_x][robot.get_robot_current_y]   = nil 
		end
		@table[i][j] = robot.get_robot_id
		
		return true
	end
	def get_table
		@table
	end

end