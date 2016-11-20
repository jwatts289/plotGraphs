function plotIndividualFreqDielectric(temp,freq,reDielectric,imDielectric)

for i=1:1:length(freq)
    plotVarTemp([num2str(freq(i)),'Hz'],temp,freq(i),reDielectric(:,i),'re[Dielectric]',0)
    plotVarTemp([num2str(freq(i)),'Hz'],temp,freq(i),imDielectric(:,i),'im[Dielectric]',0)
end

end