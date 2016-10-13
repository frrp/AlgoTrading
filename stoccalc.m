% This program takes in the following variables
% look - look back period.
% x - x-period SMA of the Fast %K
% y - y-period SMA of the Full %K
% And calculates the PnL and FIRST price. 

function [pnl pri] = stoccalc(s,look,x,y,ent,ext1,ext2)

    % Need to reverse the matrix.
    for (i = 1:length(s))
       temp(length(s)-i+1,:) = s(i,:); 
    end
    
    s = temp;
    upbound = ext1; 
    lowbound = ent;
    topmid = ext2;
    boundcol = [0.3 0.3 0.3];
    midcol = [0.4 0 0.4];

    % Form a new matrix.
    for (i = look:length(s))
        
        low = min(s(i-look+1:i,3));
        high = max(s(i-look+1:i,2));
        % First get the Fast %K.
        FastK(i) = ( ( s(i,4) - low ) / ( high - low) ) * 100;
        
    end
    
    % Now get the Full %K.
    
    for (i = look : length(s))
        tot = 0;
        for (j = i-x+1:i)
            tot = tot + FastK(j);
        end
        FullK(i) = ( tot / x );
        
    end
    
    % Now get the Full %D.
    
    for (i = look : length(s))
        tot = 0;
        for (j = i-x+1:i)
            tot = tot + FullK(j);
        end
        FullD(i) = ( tot / x );
        
    end
    
    xaxis = [1:length(FullK)];    
    len = length(xaxis);
    
    % We hope to have output a x by two vector of enter and exit points.  
    % We are using the Full%D as our indicator.
    
    % Set our mark as 0 first.
    start = look;
    marktime = look;
    mark = 1;
    count = 0;
    if (FullD(look) > ent)
        mark = 2;
            for (i = look:len)
                if (FullD(look) < ent)
                    mark = 1;
                    start = i;
                end
            end
    end
    % We start with mark = 1.
    for (i = start:len)
        if (mark == 1)
            if (FullD(i) > ent)
                mark = 2;
                count = count + 1;
                STR(count,1) = i;
                STR(count,2) = 0;
            end
        end
        if (mark == 2)
            if (FullD(i) > ext1)
                mark = 3;
            end
        end
        if (mark == 3)
            if (FullD(i) < ext2)
                mark = 4;
                STR(count,2) = i;
            end
        end
        if (mark == 4)
            if (FullD(i) < ent)
                mark = 1;
            end
        end
    end
    
	% We have the STR matrix, so now we calculate the PnL.
    pnl = 0; current = 0; pri = 0;
    for (i = 1:length(STR(:,1)))
    if ( STR(i,2) > 0 )
    current = s(STR(i,2),4) - s(STR(i,1),4);
    pnl = pnl + current;
    pnl; % Profit.
    end
    pri = s(STR(1,1),4);
    
end