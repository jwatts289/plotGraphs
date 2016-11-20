function plotVarFreq(name,temp,freq,variable,variablename)

figure
p=semilogx(freq,variable(temp,:));
xlabel('Frequency (Hz)')
ylabel(variablename)
title(name)
ax1=gca;
set(ax1,'FontName','Times New Roman')
axis tight
for i=1:length(temp)
    p(i).LineWidth = 2;
    % display points if not too dense. 15 chosen arbitrarily
    if size(variable,2) < 15
    p(i).Marker='x';
    end
end
tempLegend = arrayToLegend(temp,0,'K');
legend(tempLegend,'Location','best');

end