function plotVarTemp(name,temp,freq,variable,variablename,displayLegend)

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
if displayLegend
freqLegend = arrayToLegend(freq,0,'Hz');
legend(freqLegend,'Location','best');
end

end