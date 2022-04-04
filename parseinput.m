%This function is used to parse source b and output a character and
%propability array
function [ characterarray, propabilityarray ] = parseinput( input_args )

%initialize the starting arrays
characterarray = [];
propabilityarray = [];
flag = 0;
sum = 0;

for i=1:length(input_args)
    temp = input_args{i};
    for j=1:length(char(input_args{i}))
        for l=1:length(characterarray)
            if char(characterarray(l)) == temp(j)
                flag = 1;
                propabilityarray{l} = propabilityarray{l} + 1;
                sum = sum + 1;
            end
        end
        if(flag == 0)
            characterarray{length(characterarray) + 1} = temp(j);
            propabilityarray{length(characterarray)} = 1;
            sum = sum +1;
        end
        flag = 0;
    end
end

for i=1:length(propabilityarray)
    propabilityarray{i} = propabilityarray{i} / sum;
end
% fid = fopen('kwords.txt');
% input_args = fscanf(fid, '%s');
% fclose(fid);
% input_args[i]

end