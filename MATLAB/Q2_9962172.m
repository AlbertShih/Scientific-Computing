function Q2_9962172()

    points=[0 0; 3 0; 0 4; 1 1; 2 4; 3 2];
    pInit=[5, 5];	% Initial guess
    p=fminsearch(@(x) dist2points(x, points), pInit);
end

function sumDistance = dist2points(x,points)
    % dist2points: The sum of distance sum to points
    sumDistance=0;
for i=1:size(points,1)
	sumDistance=sumDistance+norm(x-points(i,:));
end
end