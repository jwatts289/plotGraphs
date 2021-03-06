%function plotCapConAgainstTemp(capFilename,conFilename)

% ----------- user inputs -------------------------------------------------

readFiles =1; %determines whether files need reading or not

dataSet = '16-10-18';
dataLocation = '../Data/';

sampleThickness = 0.5E-3; %m

% -------------------------------------------------------------------------

constants.eps0 = 8.85418782E-12;
constants.electrodeArea = pi*(0.5E-3)^2;
constants.sampleThickness = sampleThickness;

% -------------------------------------------------------------------------
capFilename = [dataLocation,dataSet,'_cap.xlsx'];
conFilename = [dataLocation,dataSet,'_con.xlsx'];

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
%plotFigures('decreasing',tempDec,freq,capDec,'capacitance')
%plotFigures('decreasing',tempDec,freq,conDec,'conductance')


% run analysis with respect to dielectric loss
imDielectric = conToImDielectric(freq,conDec,constants);
plotFigures('Im[Dielectric]',tempDec,freq,imDielectric,'Im[Dielectric]')

reDielectric = capToReDielectric(capDec,constants);
plotFigures('Re[Dielectric]',tempDec,freq,reDielectric,'Re[Dielectric]')

% for comparison with Arnt figure 1
% 284.9K = temp(1), 265K = temp(41), 244.8K = temp(81)
logDielectric = log10(imDielectric);
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
legend([num2str(temp(1)),' K'],[num2str(temp(41)),' K'],[num2str(temp(81)),' K'],'Location','northeast')

% calcuting temperature where omega*tau=1 (see pLVIII)
highFreq = freq(7:11);
highFreqImDi = imDielectric(:,7:11);
plotFigures('High Frequencies',tempDec,highFreq,highFreqImDi,'Im[Dielectric]')
highFreqReDi = reDielectric(:,7:11);
plotFigures('High Frequencies',tempDec,highFreq,highFreqReDi,'Re[Dielectric]')

lowFreq = freq(1:6);
lowFreqImDi = imDielectric(:,1:6);
plotFigures('Low Frequencies',tempDec,lowFreq,lowFreqImDi,'Im[Dielectric]')
lowFreqReDi = reDielectric(:,1:6);
plotFigures('Low Frequencies',tempDec,lowFreq,lowFreqReDi,'Re[Dielectric]')
    
    % same thing, but with all frequencies plotted individually -> lots of
    % graphs!
    %plotIndividualFreqDielectric(tempDec,freq,reDielectric,imDielectric)


%end

