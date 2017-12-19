function netLanes = getLanes(filename)
% written by Xenia Flamm, edited by Christina Stadler

% This function reads coordinates, ID, length and adjoining lanes related
% to edges in the net.xml file overhanded by filename

DOMedges = xmlread(filename);

% get all edges
edges = DOMedges.getElementsByTagName('edge');
len = edges.getLength;
netLanes = cell(3*len,3);

k=1;
for j = 0:len-1
   thisEdge = edges.item(j);
   
   % get xml attributes of edge j if it is not an internal edge
   if ~strcmp(thisEdge.getAttribute('function'),'internal')
       
       % get lanes within edge j
       listChild = thisEdge.getElementsByTagName('lane');
       lenLanes = listChild.getLength;
       
       % get xml attributes of ith lanes within edge j
       for i=0:lenLanes-1
           
           % xml attribute: ID
           netLanes{k+i,1} = char(listChild.item(i).getAttribute('id'));
           
           % xml attribute: length
           netLanes{k+i,2} = str2double(char(listChild.item(i).getAttribute('length')));
           
           % xml attribute: coordinates
           help = char(listChild.item(i).getAttribute('shape'));
           helpSplit = strsplit(help);
           netLanes{k+i,3} = helpSplit;
           coord = netLanes{k+i,3};                  
           nbrVertices = size(coord,2);
           for l = 1:nbrVertices   
               coord{1,l} = strsplit(coord{1,l},',');
               coord{1,l}{1,1} = str2double(coord{1,l}{1,1});
               coord{1,l}{1,2} = str2double(coord{1,l}{1,2});
           end
           netLanes{k+i,3} = coord;
           
           % xml attribute: adjoining lanes
           netLanes{k+i,4} = char(thisEdge.getAttribute('from'));
           netLanes{k+i,5} = char(thisEdge.getAttribute('to'));
       end
       k=k+lenLanes;
   end
end
emptyCells = cellfun('isempty', netLanes); 
netLanes(all(emptyCells,2),:) = [];

end