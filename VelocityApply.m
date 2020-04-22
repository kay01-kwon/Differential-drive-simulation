function wheel_vel = VelocityApply(step,random_period,prev_wheel_vel)
% 1. Input
% step : current time step
% random_period : the time step period you want to apply random control
% 2. Output
% Check the step and on the basis of random step period,
% apply the velocity

% Apply the same velocity as the previous velocity if the condition below
% is not satisfied at all.
wheel_vel = prev_wheel_vel;

% At the first step, apply any random velocity
if step == 1
    wheel_vel(1) = rand*10;
    wheel_vel(2) = rand*10;
end

% If the step corresponds to the random period, apply different random
% velocity
if mod(step,random_period) == 0
    wheel_vel(1) = rand*10;
    wheel_vel(2) = rand*10;
end

end

