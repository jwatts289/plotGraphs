% converts conductance measurements to imaginary part of dielectric
% constant
function imDielectric = conToImDielectric(freq,con,sampleThickness)

eps0 = 8.85418782E-12;
electrodeArea = pi*(0.5E-3)^2;

imDielectric = zeros(size(con));

for i = 1:1:size(con,1)
    for j = 1:1:size(con,2)
        imDielectric(i,j) = (con(i,j) * sampleThickness) /...
            ( (2*pi*freq(j)) * eps0 * electrodeArea );
    end
end

end
