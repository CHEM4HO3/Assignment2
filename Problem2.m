close all;
clear;
clc;


raw = importdata("pizza.csv"); % assumes csv file is in same directory
data = raw.data;
titles = raw.textdata;
figure
[~,ax] = plotmatrix(data(:,3:end)); % ignore all parameters except subplot axes

% ax in this case is a K x K (K columns being plotted) matrix of axes for each subplot
font = 12; % font size

% Formatting subplots - you can also make your own array of titles like title = {'one', 'two', 'three'...}
for i = 1:length(ax)
    ax(i,1).YLabel.String = titles(i+2);
    ax(i,1).YLabel.FontSize = font;
    ax(end,i).XLabel.String = titles(i+2);
    ax(end,i).XLabel.FontSize = font;
end

figure
scatter(data(:,3),data(:,9));
title("Moisture vs Calories");
xlabel("Moisture per 100g (%)");
ylabel("Calories per 100 grams (100's of cal)")

figure
scatter(data(:,5),data(:,9));
title("Fat vs Calories");
xlabel("Fat per 100g (g)");
ylabel("Calories per 100 grams (100's of cal)")

figure
scatter(data(:,6),data(:,7));
title("Ash vs Sodium");
xlabel("Ash per 100g (g)");
ylabel("Sodium per 100 grams (g)")

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

figure
scatter(data(:,5),data(:,4));
title("Fat vs Protein");
xlabel("Fat per 100g (g)");
ylabel("Protein per 100 grams (g)")


