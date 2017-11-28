function [angle, distance] = loadAngleDistance(listFiles, trainingScenarioCount, angleEnd, distanceEnd)
%This function prepares angle and distance values for as input data for the
%training process

load(listFiles(1,1).name, 'PLOSy', 'PLOSx');
angleValues = PLOSy(1:360).';
distanceValues = PLOSx.';

for c = 1:trainingScenarioCount
    for h = 1:angleEnd
        for i = 1:distanceEnd
            angle_per_dist(i,h,c) = angleValues(h);
        end
        dist_per_angle(:,h,c) = distanceValues(:);
    end
end

angle = reshape(angle_per_dist,1,[]).';
distance = reshape(dist_per_angle,1,[]).';

end

