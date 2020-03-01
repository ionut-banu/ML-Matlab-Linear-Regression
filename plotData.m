function plotData(x, xLabel, y, yLabel)

figure;

plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
ylabel(xLabel); % Set the y axis label
xlabel(yLabel); % Set the x axis label

end