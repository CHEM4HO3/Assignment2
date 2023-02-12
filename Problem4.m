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
p
R2
[t_2,p_2,R2_2] = eigen_pca(x, 3);
p_2
R2_2