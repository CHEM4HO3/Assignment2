close all;
clear;
clc;


raw = importdata("pizza.csv"); % assumes csv file is in same directory
data = raw.data;
titles = raw.textdata;

size = size(data);
data_cs = zeros(size);
means = zeros(1,size(2)-2);
stds = zeros(1,size(2)-2);
data_cs(:, 1:2) = data (:, 1:2);
for i = 3:size(2)
    col_mean = mean(data (:, i));
    col_std = std(data (:, i));
    means(i-2) = col_mean;
    stds(i-2) = col_std;
    data_cs(:, i) = (data(:, i)-col_mean)/col_std;
end

x = data_cs(:, 3:9);
[t,p,R2] = nipalspca(x, 3);
R2

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