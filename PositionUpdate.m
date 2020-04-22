function new_pos = PositionUpdate(wheel_vel,l,dt,pos)
% 1. Input Explanation
% pos : x, y, yaw at the current time step
% wheel_vel(1) : right wheel velocity
% wheel_vel(2) : left wheel velocity
% l : the length b/t right wheel and left wheel

% 2. Output Explanation
% R_c : the radious of curve of the robot's trajectory
% yawd : the yaw rate of the robot
% new_pos : x, y, yaw at the next time step

R_c = l/2 * (wheel_vel(1) + wheel_vel(2))/(wheel_vel(1)-wheel_vel(2));
yawd = (wheel_vel(1) - wheel_vel(2))/l;

% Position update at the next step through using kinematics
new_pos = Rotation(yawd*dt)*[R_c*sin(pos(3));-R_c*cos(pos(3));pos(3)]...
    + [pos(1)-R_c*sin(pos(3));pos(2)+R_c*cos(pos(3));yawd*dt];

end

