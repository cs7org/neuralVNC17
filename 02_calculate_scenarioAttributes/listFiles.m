function files = listFiles(pathFolder)
% lists all net.xml files in pathFolder

files = dir(fullfile(pathFolder,'*.net.xml'));
    
end