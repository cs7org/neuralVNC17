function [status,cmdout,output] = netconvert_matlab(thisScenario)
% written by Xenia Flamm, edited by Christina Stadler

% create name of the file to be generated
path_split = strsplit(thisScenario,'\');
path_split{1,5} = 'sumo';
path = strjoin(path_split,'\');
file_split = strsplit(path,'.');
name = file_split{1,1};
output = strjoin({name,'net.xml'},{'.'});

% call of SUMO's netconvert via cmd
C = {'netconvert --osm-files', thisScenario, '--type-files osmNetconvert.typ.xml --remove-edges.by-type highway.track,highway.unsurfaced,highway.raceway,highway.bridleway,highway.path,highway.footway,highway.pedestrian,highway.cycleway,highway.step,highway.steps,highway.stairs,highway.bus_guideway,highway.ford,railway.rail,railway.tram,railway.light_rail,railway.subway,railway.preserved,railway.narrow_gauge,railway.monorail,railway.funicular --output-file', output};
cmdstr = strjoin(C);
[status,cmdout] = system(cmdstr);
disp(cmdout)

% delete references in generated code because of firewall
DOMnet = xmlread(output);
net = DOMnet.getElementsByTagName('net');
net.item(0).removeAttribute('xsi:noNamespaceSchemaLocation');
net.item(0).removeAttribute('xmlns:xsi');

% write *.net.xml file
xmlwrite(output,DOMnet);
type(output);

end