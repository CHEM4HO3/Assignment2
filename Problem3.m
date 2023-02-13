close all;
clear;
clc;


raw = importdata("pizza.csv"); % assumes csv file is in same directory
data = raw.data;
titles = raw.textdata;

x = data(:, 3:9);
[t,p,R2] = nipalspca(x, 3);

clr = hsv(10);
figure
gscatter(t(:,1), t(:,2),data(:,1),clr,'o+*.xsd^v>')
title("Score Plot of Pizza By Brand")
xlabel('First Score t_1');
ylabel('Second Score t_2');

figure
bar(categorical(titles(3:9)), p(:,1:2))
legend(["Component 1", "Component 2"]);
title("Loadings Plot")


score_loading_plot(t(:,1), t(:,2), p(:,1), p(:,2),data(:,10),titles(3:end));