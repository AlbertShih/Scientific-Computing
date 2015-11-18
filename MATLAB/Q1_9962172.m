function output = Q1_9962172(x,y)
    
    %A=theta(1)*x+theta(2);
    A = [x,ones(size(x))];
    output = A\y;
end