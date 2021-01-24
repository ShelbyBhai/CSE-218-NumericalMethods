function [] = Task1_Plotting(data,plotName)

dataVal_size = data(:,5);
dataVal_x = data(:,1);
dataVal_color = data(:,7);
dataVal_y = data(:,2);

figure
scatter(dataVal_x,dataVal_y,dataVal_size.*0.02,dataVal_color,'filled');
xlabel('longitude value');
ylabel('latitude value');
dataVal_c = colorbar;
colormap('jet');
dataVal_c.Label.String = 'Mean Household Value';
title(plotName);