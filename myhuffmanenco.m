%dict comes from the previous myhuffmandict function
%sig is a cell aray or vector
function comp = myhuffmanenco(sig, dict) 

%Check what type sig is
if iscell(sig)
    type = 'cell';
else
    type = 'vector';
end

%Choose the larger size for the loop
[a, b] = size(sig);
if a > b
    n = a;
else
    n = b;
end

comp = [];
function code = get_code(value)
if strcmp(type, 'cell')
    value = cell2mat(value);
end
idx = find(cell2mat(dict(:,1))==value);
if ~isempty(idx)
    code = cell2mat(dict(idx,2));
else
    code = NaN;
end
end

%Initialization of i,k
i = 1;
k = 1;
%Create the encoded form
while i <= n
    code = get_code(sig(i));
    codeSize = size(code, 2);
    comp(k:k+(codeSize-1)) = code;
    k = k + codeSize;
    i = i + 1;
end
    
end