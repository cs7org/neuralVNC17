function [LOSprob] = loadLOSprob(filename)
%This function loads target data of the scenario "filename"

load(filename, 'PLOS');

% preprocessing of filename's LOS probabilities
PLOS(:,361) = [];
PLOS_ = fillmissing(PLOS,'linear');
PLOS_(PLOS_>1)=1;
PLOS_(PLOS_<0)=0;
LOSprob = reshape(PLOS_,[],1);

end

