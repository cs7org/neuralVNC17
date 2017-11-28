function netJunctions = getJunctions(filename) 
%This function reads coordinates, ID and adjoining lanes related to
%junctions in the net.xml file overhanded by filename

DOMjunctions = xmlread(filename);

% get all junctions
junctions = DOMjunctions.getElementsByTagName('junction');
len = junctions.getLength;
netJunctions = cell(len,4);

for j = 0:len-1
    thisJunction = junctions.item(j);  

    % get xml attributes of junction j if it is not an internal junction                   
    if ~strcmp(thisJunction.getAttribute('type'),'internal') 

        % xml attribute: ID
        netJunctions{j+1,1} = char(thisJunction.getAttribute('id'));

        % xml attribute: incoming lanes
        help = char(thisJunction.getAttribute('incLanes'));
        helpSplit = strsplit(help);
        netJunctions{j+1,2} = helpSplit;

        % xml attribute: coordinates
        netJunctions{j+1,3} = str2double(thisJunction.getAttribute('x'));
        netJunctions{j+1,4} = str2double(thisJunction.getAttribute('y'));
    end
end
emptyCells = cellfun('isempty', netJunctions); 
netJunctions(all(emptyCells,2),:) = [];

end