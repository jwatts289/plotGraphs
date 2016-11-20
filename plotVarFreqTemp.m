function plotVarFreqTemp(name,temp,freq,variable,variablename)

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