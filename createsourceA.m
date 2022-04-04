% Randomly creates a character array with its propability array
function [ characterarray, propabilityarray] = createsourceA()

characterarray = 'a' : 'z';
amountarray = [];
propabilityarray = [];
sum = 0;
temp = 0;

for i=1:length(characterarray)
    temp = randi(100);
    amountarray(i) = temp;
    sum = sum + temp;
end

for i=1:length(characterarray)
    propabilityarray(i) = amountarray(i) / sum;
end
disp(propabilityarray);
disp(characterarray);
end
