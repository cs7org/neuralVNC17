function areaBuildings = compPolys(polys)
% written by Xenia Flamm, comments by Christina Stadler

% This function calculates the area of all buildings from their coordinates
% stored in variable polys

nbrPolys = size(polys,1);                           % number of buildings/polys
areaBuildings = zeros(nbrPolys,1);

for i = 1:nbrPolys                                  % loop for the calculation of every building's/poly's area
    coord = polys{i,2};                             % read coordinates of the ith building in the ith row of the variable poly
    nbrVertices = size(coord,2);                    % number of coordinates
    area = 0;                                       
    coordsNextPt = coord{1,1};
    if isequal(coord{1,1}, coord{1,nbrVertices})    % check whether the first and the last coordinate are the same (means the building area is closed)
        for j = 1:nbrVertices-1                     % calculation of the ith building area starts
            coordsThisPt = coordsNextPt;
            coordsNextPt = coord{1,j+1};
            area = area + ( coordsThisPt{1,1} + coordsNextPt{1,1} ) * ( coordsNextPt{1,2} - coordsThisPt{1,2} );
        end    
        areaBuildings(i) = abs(area*0.5);
    else
        areaBuildings(i) = 0;                       % the coordinates do not representate a buildings outline, if check fails 
    end
end

end