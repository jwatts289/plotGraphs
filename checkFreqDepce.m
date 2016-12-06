i=length(temp);
while i>0
    plotVarFreq('Im[dielectric]',i,freq,dielectric.im,'Im[dielectric]')
    ylim([-inf,50])
  %  prompt = 'delete? Y/N';
  %  x = input(prompt,'s');
  x='n';
    if x == 'y' || x=='Y'
        close
    end
    i=i-5;
end
