function plotFigures(name,temp,freq,variable,variablename)

% plot variable against temperature
plotVarTemp(name,temp,freq,variable,variablename,1)

%choose subset of temperatures to plot
numTemp = 10;
tempIncrement = length(temp)/(numTemp+1);
tempSubset = round(tempIncrement);
for i = 2:1:numTemp+1
   tempSubset=[tempSubset,round(i*tempIncrement)];
end
tempLegend = arrayToLegend(temp,tempSubset,'K');

plotVarFreq(name,tempSubset,freq,variable,variablename)

plotVarFreqTemp(name,temp,freq,variable,variablename)
end