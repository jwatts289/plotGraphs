function plotFigures(name,temp,freq,variable,variablename)

% plot variable against temperature
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
freqLegend = arrayToLegend(freq,0,'Hz');
legend(freqLegend,'Location','best');

%choose subset of temperatures to plot
numTemp = 10;
tempIncrement = length(temp)/(numTemp+1);
tempSubset = round(tempIncrement);
for i = 2:1:numTemp+1
   tempSubset=[tempSubset,round(i*tempIncrement)];
end
tempLegend = arrayToLegend(temp,tempSubset,'K');

figure
p=semilogx(freq,variable(tempSubset,:));
xlabel('Frequency (Hz)')
ylabel(variablename)
title(name)
legend(tempLegend,'Location','best');
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