close all;
clear;
clc;


raw = importdata("pizza.csv"); % assumes csv file is in same directory
data = raw.data;
titles = raw.textdata;

x = data(:, 3:9);

[t,p,R2] = nipalspca(x, 3);
p
R2
[t_2,p_2,R2_2] = eigen_pca(x, 3);
p_2
R2_2
