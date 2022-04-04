function [ encode, total_length ] = myhuffmandict( characterarray, propabilityarray )
%Create Huffman Tree
huffmantree = struct('character', [], 'propability', [], 'child', [], 'encoding', [], 'startingOrder', -1);
for i=1:length(characterarray)
    huffmantree(i).character = characterarray(i);
    huffmantree(i).propability = propabilityarray(i);
    huffmantree(i).startingOrder = i;
end

%Sort the characters in ascending order according to their propabilities
[p, j] = sort(propabilityarray);
huffmantree = huffmantree(j);

%Creating the tree
huffmantree = maketree(huffmantree); 
%Creating the codes
[huffmantree, encode, total_length] = makecode(huffmantree, {}, 0);

%Making the Huffman tree with this function
function huffmantree = maketree(huffmantree)
    while(length(huffmantree) > 1)
        temptree = struct('character', [], 'propability', [], 'child', [], 'encoding', []);
        for i=1:2
            temptree.propability = temptree.propability + huffmantree(1).propability;
            temptree.child(i) = huffmantree(1);
            temptree.startingOrder = -1;
            huffmantree(1) = [];
        end
        
        %Inserting Node into sorted list so that the list stays in ascending
        %order
        i=1;
        while((length(huffmantree) >= i) && (temptree.propability > huffmantree.propability))
            i=i+1;
        end
        %Adding the node in the right spot
        huffmantree = [huffmantree(1:i-1) temptree huffmantree(i:end)];
        
        %Recursion
        huffmantree = maketree(huffmantree);
    end

end

%Function for the coding
function [huffmantree, encode, total_length] = makecode(huffmantree, encode, total_length)
    %If the node doesnt have a child its a leaf node so we at its code
    %to the list
    if(isempty(huffmantree.child))
        encode{end+1, 1} = huffmantree.character;
        encode{end, 2} = huffmantree.encoding;
        encode{end, 3} = length(huffmantree.encode);
        encode{end, 4} = huffmantree.startingOrder;
        total_length = total_length + length(huffmantree.encoding)*huffmantree.probability;
        return;
    end
    children_amount = length(huffmantree.child);
    for i=1:children_amount
        huffmantree.child{i}.encoding = [huffmantree(end).encoding, (children_amount-i)];
        [huffmantree.child{i}, encode, total_length] = makecode(huffmantree.child{i}, encode, total_length);
    end
end
end