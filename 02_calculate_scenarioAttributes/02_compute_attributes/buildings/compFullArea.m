function area = compFullArea (filename1,filename2)
% written by Xenia Flamm, comments by Christina Stadler

% This function calculates the full area of a scenario from the boundaries'
% coordinates of the corresponding poly.xml and net.xml files
% These boundaries run along the outermost road or building coordinate on 
% each side
    
DOMnet = xmlread(filename1);
location1 = DOMnet.getElementsByTagName('location');
help1 = char(location1.item(0).getAttribute('convBoundary'));   % read coordinates of net.xml file boundaries
coord1 = strsplit(help1,',');
area1 = (str2double(coord1{1,3})-str2double(coord1{1,1})) * (str2double(coord1{1,4})-str2double(coord1{1,2})); % calculates area in m²

DOMpoly = xmlread(filename2);
location2 = DOMpoly.getElementsByTagName('location');
help2 = char(location2.item(0).getAttribute('convBoundary'));   % read coordinates of poly.xml file boundaries
coord2 = strsplit(help2,',');
area2 = (str2double(coord2{1,3})-str2double(coord2{1,1})) * (str2double(coord2{1,4})-str2double(coord2{1,2})); % calculates area in m²

% chooses the bigger area out of the two calculated 
if area1 >= area2
    area=area1;
else
    area = area2;
end

end