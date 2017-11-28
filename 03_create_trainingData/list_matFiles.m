function files = list_matFiles(path_str_results)
%This function reads all mat-files in the folder "path_str_results"

files = dir(fullfile(path_str_results,'*WD_1_5_losprob.mat'));
    
end