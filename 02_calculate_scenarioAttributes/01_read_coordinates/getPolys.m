function polyBuildings = getPolys(filename)
% written by Xenia Flamm, comments by Christina Stadler

% This function reads ID and coordinates related to buildings in the
% poly.xml file overhanded by filename

DOMpolys = xmlread(filename);

% get all polys
polys = DOMpolys.getElementsByTagName('poly');
len = polys.getLength;
polyBuildings = cell(len,2);

for j = 0:len-1
   thisPoly = polys.item(j);

   % get xml attributes of poly j if it is a building                   
   if strcmp(thisPoly.getAttribute('type'),'building')
       
       % xml attribute: ID
       polyBuildings{j+1,1} = char(thisPoly.getAttribute('id'));
       
       % xml attribute: coordinates
       help = char(thisPoly.getAttribute('shape'));
       helpSplit = strsplit(help);
       polyBuildings{j+1,2} = helpSplit;
       coord = polyBuildings{j+1,2};                  
       nbrVertices = size(coord,2); 
       for i = 1:nbrVertices   
           coord{1,i} = strsplit(coord{1,i},',');
           coord{1,i}{1,1} = str2double(coord{1,i}{1,1});
           coord{1,i}{1,2} = str2double(coord{1,i}{1,2});
       end
       polyBuildings{j+1,2} = coord;
   end   
end
emptyCells = cellfun('isempty', polyBuildings); 
polyBuildings(all(emptyCells,2),:) = [];

end