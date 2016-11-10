function [freq,temp,cap,con] = readCapCon(capFilename,conFilename)

freqRange = 'B1:L1';
tempRange = 'A2:A742';
dataRange = 'B2:L742';

cap = xlsread(capFilename, dataRange);
con = xlsread(conFilename, dataRange);
freq = xlsread(capFilename,freqRange);
temp = xlsread(capFilename,tempRange);

end