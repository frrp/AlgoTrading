% It plots the stochastic indicator of a stock.
% For the input argument int, use
% look - look back period.
% x - x-period SMA of the Fast %K
% y - y-period SMA of the Full %K
% This function will ALSO calculate the profit and lost and Sharpe ratio.
% If we wanted to, we can then output the calculated values to other programs. 

function STR = stoc(s,look,x,y,ent,ext1,ext2)

    % close;
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
        for (j = i-y+1:i)
            tot = tot + FullK(j);
        end
        FullD(i) = ( tot / y );
        
    end
    
    xaxis = [1:length(FullK)];    
    len = length(xaxis);

    %figure;
    hold on;
    plot(xaxis(look:len),FullK(look:len),'Color',[0.87 0 0.3]);
    plot(xaxis(look:len),FullD(look:len),'Color',[0.2 0 0.4]);
    
    % Draw the high low lines for our trading strategy.
    line([1 length(s)],[upbound upbound],'LineWidth',1,'Color',boundcol);
    line([1 length(s)],[lowbound lowbound],'LineWidth',1,'Color',boundcol);
    line([1 length(s)],[topmid topmid],'LineWidth',1,'Color',midcol);

    hold off;
    
    set(gca,'FontName','Monaco');    
    title(strcat(inputname(1),' with Stochastic Indicator(',...
        num2str(look),',',num2str(x),',',num2str(y),')'),'FontSize',10);
    set(gcf, 'Name',strcat(inputname(1),' with Stochastic Indicator with parameters: ',...
        num2str(look),',',num2str(x),',',num2str(y)));
    ylabel('Stochastic Indicator (%)');
    xlabel('Time (1 day)');
    %set(gcf,'Position',[100 500 1100 700]);
    grid on;
    
    % Now we implement our enter and exit strategy.
    text(0,ent,[' ENTER time:',num2str(ent)],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',10,'FontName','Monaco')
    text(0,ext1,[' CHECK time:',num2str(ext1)],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',10,'FontName','Monaco')        
    text(0,ext2,[' EXIT time:',num2str(ext2)],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',10,'FontName','Monaco')        
    
    
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
    
	% Now with the data in the STR matrix, we can plot the enter and exit
	% points.
    hold on;
    for (i = 1:length(STR(:,1)))
        plot(STR(i,1),FullD(STR(i,1)),'r^','MarkerSize',8,'MarkerFaceColor','r');     % Mark intersection with red arrow.
        text(STR(i,1),FullD(STR(i,1)),[' Buy at ',num2str(STR(i,1))],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',12,'FontName','Monaco')
        text(STR(i,1),FullD(STR(i,1)),[' Pr: ',num2str(s(STR(i,1),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',14,'FontName','Monaco')
        if (STR(i,2) > 0)
        plot(STR(i,2),FullD(STR(i,2)),'bv','MarkerSize',8,'MarkerFaceColor','b');     % Mark intersection with blue arrow.
        text(STR(i,2),FullD(STR(i,2)),[' Sell at ',num2str(STR(i,2))],...
                'VerticalAlignment','top',...
                'HorizontalAlignment','left',...
                'FontSize',12,'FontName','Monaco')
        text(STR(i,2),FullD(STR(i,2)),[' Pr: ',num2str(s(STR(i,2),4))],...
                'VerticalAlignment','bottom',...
                'HorizontalAlignment','left',...
                'FontSize',14,'FontName','Monaco')
        end
    end
    hold off;
end