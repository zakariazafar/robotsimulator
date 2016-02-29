# A Service to executes the commands
class Command
	def initialize
		@robot_manager = RobotManager.new
	end
	def is_valid_command(robot,command)
	   return false if robot.nil? && command != 'create'
	   return true  if robot.nil? && command == 'create'
	   return (robot.get_robot_current_x.nil? && command != 'place') ? false : true
	end
	def parse_command(commands)
		command, *rest = commands.split(/ /)
	    command = command.downcase
	    
		params = rest[0].split(",")
		
		robot_id   = params[0].to_i
        robot = @robot_manager.get_robot_by_id(robot_id)

        return false if is_valid_command(robot,command)===false
		case command
		when 'create'
			return false if params.length != 2
			
			robot_name = params[1].strip!
			
			return false if !@robot_manager.is_unique_id(robot_id) || !@robot_manager.is_unique_name(robot_name)
			robot = Robot.new(robot_id,robot_name)
			
			@robot_manager.update_robot_manager(robot )
		
		when 'place'
			
			return false if params.length != 4
			
			if $table.place_robot_on_table(robot,params[1].to_i,params[2].to_i) === true
			robot = RobotMove.place(robot,params[1].to_i,params[2].to_i,params[3].upcase.strip!)
			@robot_manager.set_robot_by_id(robot.get_robot_id,robot)
			
		    end

		when 'move'
			return false if params.length != 1
			robot = RobotMove.move(robot)
			@robot_manager.set_robot_by_id(robot.get_robot_id,robot)
			
		
		when 'left'
			return false if params.length != 1
			
			robot = RobotMove.left(robot)
			@robot_manager.set_robot_by_id(robot.get_robot_id,robot)
			
		when 'right'
			return false if params.length != 1
			
			robot = RobotMove.right(robot)
			@robot_manager.set_robot_by_id(robot.get_robot_id,robot)
			
		when 'report'
			return false if params.length != 1
			
			Print.current_position(robot)
		when 'trace'
			return false if params.length != 1
			
			Print.trace(robot)
		
		else
			return
		end
		
	end


end