function crossings = compNbrCrossings(angles)
% written by Xenia Flamm, comment by Christina Stadler

% This function checks whether angles are crossings by definition (>45° and
% <135°); this definition can be changed here

crossings = 0;
for j=1:size(angles,3)
    for i=1:size(angles,1)
        for l=1:size(angles,2)
            quit = 0;
            if abs(angles(i,l,j)) > pi/4 && abs(angles(i,l,j)) < 3*pi/4
                crossings = crossings + 1;
                quit = 1;
                break;
            end
        end
        if quit
            break;
        end
    end
end 

end
