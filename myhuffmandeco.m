%Comp is derived from the previous function huffmanenco and its a row or
%column vector
function dcell = myhuffmandeco(comp,dict) 

%Initialization of beggining and ending
first = 1; last = 1;
%Output array
dcell = {};
[a, b] = size(comp);

if a <= b
    n = b;
else
    n = a;
end
dict_size = size(dict,1);

%Function to derive the correct symbols 
function symbol = makesymbol(code)
symbol = NaN;
for j = 1:dict_size
    tmpCode = cell2mat(dict(j,2));
    tmpCodeSize = size(tmpCode, 2);
    codeSize = size(code, 2);
    if tmpCodeSize > codeSize
        break;
    end
    if codeSize == tmpCodeSize
        if tmpCode == code
        symbol = cell2mat(dict(j,1));
        break;
        end
    end
end
end

while last < n
    symbol = makesymbol(comp(first:last));
    while isnan(symbol)
        last = last + 1;
        symbol = makesymbol(comp(first:last));
    end
    
    dcell{size(dcell,2)+1} = symbol;
    if last ~= n
        last = last + 1;
        first = last;
    end
end

end
