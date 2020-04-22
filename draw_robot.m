function draw_robot(pos,delay)

% Robot size
r = 55/2;
angle_robot = 0:0.1:2*pi+0.2;
rx = pos(1) + r * cos(angle_robot);
ry = pos(2) + r * sin(angle_robot);

% Draw robot body
plot(rx,ry);
hold on;
line([pos(1) pos(1) + r * cos(pos(3))],[pos(2) pos(2) + r*sin(pos(3))]);
axis([-100 250 0 250]);
pause(delay);
xlabel('x (mm)')
ylabel('y (mm)')
hold off;
end

