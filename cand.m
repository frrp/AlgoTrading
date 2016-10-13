% This function will draw a candlestick.
% It will take the following parameters:
% o - open.
% h - high.
% l - low.
% c - close.
% t - time. (Usually in days)


function cand(o,h,l,c,t,col)

hold on;

if (o > c)
    % high is greater than low. Have to FILL in!
    line([t-1 t],[o o],'Color',col)
    line([t-1 t],[c c],'Color',col)
    line([t-1 t-1],[c o],'Color',col)
    line([t t],[c o],'Color',col)
    line([t-0.5 t-0.5],[o h],'Color',col)
    line([t-0.5 t-0.5],[c l],'Color',col)
    fill([t-1 t t t-1],[c c o o],col)
    
else if (o < c)
        
        % high is less than low.
        line([t-1 t],[o o],'Color',col)
        line([t-1 t],[c c],'Color',col)
        line([t-1 t-1],[o c],'Color',col)
        line([t t],[o c],'Color',col)
        line([t-0.5 t-0.5],[c h],'Color',col)
        line([t-0.5 t-0.5],[o l],'Color',col)
        
    else
        
        % high is equal to low.
        line([t-1 t],[o o],'Color',col)
        line([t-0.5 t-0.5],[o h],'Color',col)
        
    end
    
end
hold off;

end