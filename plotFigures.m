function plotFigures(name,temp,freq,variable,variablename)

figure
p = plot(temp,variable);
ax = gca;
xlabel('Temperature (K)')
ylabel(variablename)
title(name)
set(ax,'FontName','Times New Roman')
axis tight
for i=1:size(variable,2)
    p(i).LineWidth = 2;
    % display points if not too dense. 15 chosen arbitrarily
    if size(variable,1) < 15
    p(i).Marker='x';
    end
end
%legend(freq);

%choose subset of temperatures to plot
numTemp = 10;
tempIncrement = length(temp)/(numTemp+1);
tempSubset = round(tempIncrement);
tempLegend=cell(1,numTemp+1);
tempLegend{1} = [num2str(temp(round(tempIncrement))),'K'];
%tempLegend = num2str(round(temp(tempSubset)));
for i = 2:1:numTemp+1
   tempSubset=[tempSubset,round(i*tempIncrement)];
   tempLegend{i}=[num2str(temp(round(i*tempIncrement))),'K'];
 %  tempLegend = [tempLegend,',',num2str(temp(round(i*tempIncrement)))];
end

figure
p=semilogx(freq,variable(tempSubset,:));
xlabel('Frequency (Hz)')
ylabel(variablename)
title(name)
legend(tempLegend);
ax1=gca;
set(ax1,'FontName','Times New Roman')
axis tight
for i=1:length(tempSubset)
    p(i).LineWidth = 2;
    % display points if not too dense. 15 chosen arbitrarily
    if size(variable,2) < 15
    p(i).Marker='x';
    end
end

logFreq = log10(freq);
figure
s = surf(logFreq,temp,variable);
colormap colorcube
xlabel('log(freq)')
ylabel('Temperature (K)')
zlabel(variablename)
title(name)
set(s,'edgecolor','none')
colorbar
ax2 = gca;
set(ax2,'FontName','Times New Roman')
axis tight
end