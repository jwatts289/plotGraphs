function dielectricLoss = conToDielectricLoss(freq,con)

eps0 = 8.85418782E-12;

dielectricLoss = zeros(size(con));

for i = 1:1:size(con,1)
    for j = 1:1:size(con,2)
        dielectricLoss(i,j) = con(i,j)/(2*pi*freq(2)*eps0);
    end
end

end