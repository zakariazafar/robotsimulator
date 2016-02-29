##  RobotSimulator

. The application is a simulation of one or more toy robots moving on a square tabletop, of dimensions 5 units x 5 units.
. Two robots cannot be moved or placed to the same square at the same time. There are no other obstructions on the table surface.
. The robots are free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.
. You can assume that the table surface is an static entity, no need to save it to the DB.
. The Robot entity will hold the robot ID and NAME (which should be unique)
 
. Create an application that can read in commands of the following form -

    CREATE ROBOT_ID, ROBOT_NAME
    PLACE ROBOT_ID,X,Y,F
    MOVE ROBOT_ID
    LEFT ROBOT_ID
    RIGHT ROBOT_ID
    REPORT ROBOT_ID
    TRACE ROBOT_ID
 
. CREATE will create a new robot, but that will not place the robot on the table.
. PLACE will put a toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
. The origin (0,0) can be considered to be the SOUTH WEST most corner.
. The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed for the robot.
. MOVE will move a toy robot one unit forward in the direction it is currently facing.
. LEFT and RIGHT will rotate a robot 90 degrees in the specified direction without changing the position of the robot.
. REPORT will announce the X,Y and orientation of the robot.
. TRACE will show a list of all the robot movements (X1,Y1 -> X2,Y2) history (including where the robot was place and the current position)
. A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT, REPORT and TRACE commands.
. Provide test data to exercise the application.
 

## CONSTRAINTS:

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
 
## EXAMPLE INPUT AND OUTPUT:
  a)
  CREATE 1,robot1
  PLACE 1,0,0,NORTH
  MOVE 1
  REPORT 1
    Output: 0,1,NORTH
  TRACE 1
    Output:
      (0,0) -> (0,1)
 
  b)
  CREATE 1,robot1
  PLACE 1,0,0,NORTH
  LEFT 1
  REPORT 1
    Output: 0,0,WEST
  TRACE 1
    Output:
      "Robot did not move"
 
  c)
  CREATE 1,robot1
  PLACE 1,1,2,EAST
  MOVE 1
  MOVE 1
  LEFT 1
  MOVE 1
  REPORT 1
    Output: 3,3,NORTH
  TRACE
    Output:
      (1,2) -> (2,2)
      (2,2) -> (3,2)
      (3,2) -> (3,3)

## Install and Execute##

From your terminal clone the repository or download the source file and enter to the application root directory.

Then execute

    ruby main.rb

Start entering the commands.

    -1
to exit from the application.

## Application Structure##

Two models have been used in this application named **Robot** and **RobotPositions**. A Robot has many RobotPositions. All models exists at

--models/

directory.

To facilitates the models there are several services used in the 

||services/

directory. Such as 
-- **RobotMove** for the movements of the Robot, 
-- **Print** for the reporting of RobotPositions
-- **Command** for executing Commands.

**TableTop** is the blue print of the TableTop where the Robots will move.
