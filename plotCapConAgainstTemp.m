%function plotCapConAgainstTemp(capFilename,conFilename)

readFiles = 1; %determines whether files need reading or not

capFilename = '16-10-18_cap.xlsx';
conFilename = '16-10-18_con.xlsx';

if readFiles == 1
    [freq,temp,cap,con] = readCapCon(capFilename,conFilename);
end

%find minimum temperature
%split data into decreasing and increasing
[minTemp,minTempIndex] = min(temp);
tempDec = temp(1:minTempIndex);
capDec = cap([1:minTempIndex],:);
conDec = con([1:minTempIndex],:);

% plot data
%plotFigures('decreasing and increasing',temp,freq,cap,con)
plotFigures('decreasing',tempDec,freq,capDec,'capacitance')
plotFigures('decreasing',tempDec,freq,conDec,'conductance')


% run analysis with respect to dielectric loss
diLoss = conToDielectricLoss(freq,conDec);
plotFigures('dielectric loss',tempDec,freq,diLoss,'dielectric loss')

% for comparison with Arnt figure 1
% 284.9K = temp(1), 265K = temp(41), 244.8K = temp(81)
logDielectric = log10(diLoss);
figure
p = semilogx(freq,logDielectric([1,41,81],:));
p(1).LineWidth = 2;
p(1).Marker = 'o';
p(2).LineWidth = 2;
p(2).Marker = 's';
p(3).LineWidth = 2;
p(3).Marker = '^';
axis tight
ax = gca;
set(ax,'FontName','Times New Roman')
ylabel('dielectric loss (log scale)')
xlabel('frequency (Hz)')
title('dielectric loss')
legend([num2str(temp(1)),' K'],[num2str(temp(41)),' K'],[num2str(temp(81)),' K'],'Location','southeast')

%end

