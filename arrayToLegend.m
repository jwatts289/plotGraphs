function legendText = arrayToLegend(array,indices,units)

if indices(1) ~= 0
    for i=1:1:length(indices)
       legendText{i} = [num2str(array(round(indices(i)))),units];
    end
else
    for i=1:1:length(array)
        legendText{i} = [num2str(array(i)),units];
    end
end
end