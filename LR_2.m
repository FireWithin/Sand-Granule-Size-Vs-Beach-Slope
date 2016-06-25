% Linear Regression in Octave
% @author: Aditya

x = load('gvim_data.dat');
y = x(:,2);
x(:,2) = [];
plot(x,y,'o');
xlabel('diameter of sand granules');
ylabel('slope of beach');
theta = [0;0];
m = length(y);              % number of training samples
J_h = zeros(1500,1);
alpha = 0.07;               % learning rate
x = [ones(m,1),x];
for i=1:1500,
    J_h(i) = EvaluateCost(x,y,theta);
    predictions = x*theta;
    k = predictions - y;
    theta(1) = theta(1) - alpha * (1/m) * sum(k.*x(:,1));
    theta(2) = theta(2) - alpha * (1/m) * sum(k.*x(:,2));
 end;
 disp(theta);
 hold on;
plot(x(:,2),x*theta,'-');
legend('Training data', 'Linear Regression');
% visualisation of cost function
% since we have only 2 paarameters (theta is 2 dimensional)
% we can plot J(theta)
figure;
J_val = zeros(100,100);
theta0_val = linspace(-3,3,100);
theta1_val = linspace(0,20,100);
for i=1:length(theta0_val),
  for j=1:length(theta1_val),
    th = [theta0_val(i);theta1_val(j)];
    J_val(i,j) = EvaluateCost(x,y,th);
  end;
end;
J_val = J_val';
surf(theta0_val,theta1_val,J_val);
xlabel('\theta_0');
ylabel('\theta_1');
zlabel('J(\theta)');