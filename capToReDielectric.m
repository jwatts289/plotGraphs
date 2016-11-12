% converts capacitance measurements to real part of dielectric
% constant
function reDielectric = capToReDielectric(cap,constants)
    
eps0 = constants.eps0;
electrodeArea = constants.electrodeArea;
sampleThickness = constants.sampleThickness;

reDielectric = cap * (sampleThickness / (eps0 * electrodeArea));

end