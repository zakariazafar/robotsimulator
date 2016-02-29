# A Service to manage a Robot and its constraints
class RobotManager
	def initialize
	@robots_info = {}
	@robots      = {}
    end
	def update_robot_manager(robot)
		
		@robots_info[robot.get_robot_id] = robot.get_robot_name
		@robots[robot.get_robot_id] = robot 
	end
	def is_unique_id(id)
		!@robots_info.keys.include?(id)
	end
	def is_unique_name(name)
		!@robots_info.values.include?(name)
	end
	def get_robot_by_id(id)
		@robots[id]
	end
	def set_robot_by_id(id,robot)
		@robots[id] = robot 

	end
	def get_robots
		@robots
	end
end