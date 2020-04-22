clear all;
close all;
% Modify the random step period : 
% case 1) 1 
% case 2) 10
% case 3) 100

% Random step period
random_period = 100;

% wheel separation
l = 50;

% Publish rate (Hz) --> Delay second
publish_rate = 100;
delay = 1/publish_rate;

% Time initialization
t_curr = 0;
t_last = 0;
dt = 0.1;

% Robot's position : x, y, yaw
p = zeros(3,1);

% Initial position setting
p(1) = (-100+250)/2;
p(2) = (0+250)/2;

% Initial velocity setting
wheel_vel(1,1) = 0;
wheel_vel(2,1) = 0;

% The purpose of step
% 1. Step for dynamic variable storage - I think there is no available dynamic
% variable in Matlab like std::vector<> in cpp
% 2. Step to apply random velocity
step = 1;

for time = 0:0.1:10
t_curr = time;

draw_robot(p,delay);

% Dynamic variables
wheel_vel_vector(:,step) = wheel_vel;
p_vector(:,step) = p;
time_vector(1,step) = time;

% The VelocityApply function allow the robot to get velocity
% The velocity is randomly applied to the robot based on the random period
wheel_vel = VelocityApply(step,random_period,wheel_vel);

% Position Update - Next position after applying control input to the robot
p = PositionUpdate(wheel_vel,l,dt,p);

dt = t_curr - t_last;
t_last = t_curr;

step = step + 1;

end

figure(2)
subplot(2,2,1)
plot(time_vector,p_vector(1,:));
title('x - t');
xlabel('time (second)')
ylabel('x_{global} (mm)')

subplot(2,2,2)
plot(time_vector,p_vector(2,:));
title('y - t');
xlabel('time (second)')
ylabel('y_{global} (mm)')

subplot(2,2,3)
plot(time_vector,p_vector(3,:)*180/pi);
title('\psi - t');
xlabel('time (second)')
ylabel('\psi (deg)')

figure(3)
plot(p_vector(1,:),p_vector(2,:))
title('x - y');
xlabel('x (mm)')
ylabel('y (mm)')

figure(4)
plot(time_vector,wheel_vel_vector);
title('wheel velocity - t');
xlabel('time (second)');
ylabel('\omega (rad/s)');
legend('wheel right','wheel left')