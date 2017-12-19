function [status,cmdout] = polyconvert_matlab(thisScenario,generatedNetFile)          
% written by Xenia Flamm, edited by Christina Stadler

% create name of the file to be generated
file_split = strsplit(generatedNetFile,'.');
name = file_split{1,1};
output = strjoin({name,'poly.xml'},{'.'});

% call of SUMO's netconvert via cmd
C = {'polyconvert --osm-files', thisScenario, '--type-file osmPolyconvert.typ.xml --net-file', generatedNetFile, '--output-file', output, '--proj.utm t'};
cmdstr = strjoin(C);
[status,cmdout] = system (cmdstr);
disp(cmdout);

% delete references in generated code because of firewall
DOMpoly = xmlread(output);
poly = DOMpoly.getElementsByTagName('additional');
poly.item(0).removeAttribute('xsi:noNamespaceSchemaLocation');
poly.item(0).removeAttribute('xmlns:xsi');

% write *.net.xml file
xmlwrite(output,DOMpoly);
type(output);

end