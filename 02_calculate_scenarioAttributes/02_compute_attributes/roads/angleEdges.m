function angle = angleEdges (graph, midNode, node1, node2)
%Thias function calculates the angle between node1 and node2 linking via
%midNode

midNodeCoord = graph.Nodes.Coordinates(midNode,:);
node1Coord = graph.Nodes.Coordinates(node1,:);
node2Coord = graph.Nodes.Coordinates(node2,:);
p_1 = node1Coord - midNodeCoord;
p_2 = node2Coord - midNodeCoord;
l1 = norm(p_1);
l2 = norm(p_2);
prod = dot(p_1,p_2)/(l1*l2);
angle = acos(prod);
    
end