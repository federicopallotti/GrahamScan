%input set of points
data = rand(15,2);

%call of the main function
res = g_s(data);

% orientation test function
function orientation = orient_test(points)
     mat = [1, points(1,1), points(1,2); 1, points(2,1), points(2,2); 1, points(3,1), points(3,2)];
     orientation = det(mat);
end

%graham scan algorithm
function uh_pts = g_s(points)
    sorted = sortrows(points);
    %push first 2 points
    stack= sorted(1,:);
    stack=[stack; sorted(2,:)];
    %loop through all the others
    for k = 3:length(sorted)
        while size(stack,1) >= 2 && orient_test([sorted(k,:); stack(end,:);stack(end-1,:)]) <= 0
            %pop the stack
            stack(end,:) = [];
        end
        stack = [stack; sorted(k,:)];
    end
    uh_pts = stack;
    
    %compute lower hull
    sorted = sortrows(points);
    %push first 2 points
    stack= sorted(1,:);
    stack=[stack; sorted(2,:)];
    %loop through all the others
    for k = 3:length(sorted)
        while size(stack,1) >= 2 && orient_test([sorted(k,:); stack(end,:);stack(end-1,:)]) >= 0
            %pop the stack
            stack(end,:) = [];
        end
        stack = [stack; sorted(k,:)];
    end
    lh_pts = stack;
    h_pts= [uh_pts; lh_pts((end-1):-1:2,:)];
    
    %plotting 
    X = h_pts(:,1);
    Y = h_pts(:,2);
    hold on
    pgon = polyshape( X , Y );
    plot(pgon)
    scatter(points(:,1),points(:,2));
    title('Convex Hull')
end

         
           
            
            
    
    


















