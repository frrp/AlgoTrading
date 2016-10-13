% This plots the candlestick graph for a certain stock, at the same time
% allowing the user to select the lookback period.
% The input argument is the matrix concern.
% ourData is the output vector for the script readdata.

function DatatoPlot = cand2(ourData,period)

% We first want to trim the data matrix.
clear DatatoPlot;
DatatoPlot = trimdata(ourData,period);

%subplot(1,6,[1:5]);
%drawcand(DatatoPlot);
%xlabel('Time','FontName','Monaco');

%set(gcf,'Position',[0 500 1440 750]);
   


end

% This function will edit our data matrix accordingly.
function NewData = trimdata(InData,period)


% We calculate the open here.
i = 1;
k = 1; % Separate counter for new data.
while (i + period - 1 < ceil ( (length(InData(:,1))-1)  ))
    
    % If statement here to catch the time which is within (period - 1) from
    % 1229.
    
    if ( 1229 > ( InData(i,2) ) && min2time(InData(i,2), period-1) > 1359  )
        
        % Look back period cuts into second portion.
            i2 = i;
            period2 = period - 88;
            %{
            i
            period2
            break
            %}
            % Open.
            NewData(k,3) = InData(i2,3);
            % Close.
            NewData(k,6) = InData(i2 + period2,6);
            % High. Low. Go back and recurse forward.
            max = InData(i2,4);
                for (j = i2:i2 + period2)
                    if (InData(j,4) > max)
                    max = InData(j,4);
                    end
                end
            NewData(k,4) = max;
            min = InData(i2,5);
                for (j = i2:i2 + period2)
                    if (InData(j,4) < min)
                    min = InData(j,5);
                    end
                end
            NewData(k,5) = min;
            NewData(k,2) = InData(i2,2);% +period2,2);
            NewData(k,1) = InData(i2,2);% +period2,1);
            NewData(k,7) = sum(InData(i2:i2+period2,7));
            NewData(k,8) = sum(InData(i2:i2+period2,8));
            i = i2 + period2 + 1;
            k = k + 1;
            
        
    else
    
    
    if ( 1229 < min2time( InData(i,2),period-1 ) && min2time(InData(i,2) , period-1) < 1359 )
        
        % Go back first to the original i.
        clear i2;
        clear period2;
        
        i2 = i;
     
        % Does NOT cross 1359
        % if (  period < ( 60 - rem( InData(i2,2) , 100 ) ) + 59 )
            
            period2 = mindiff(InData(i,2),1229);
            % We have to have the look back period. We want to keep the
            % original look back period cause will need it to store in
            % NewData.
            
            % Open.
            NewData(k,3) = InData(i2,3);
            % Close.
            NewData(k,6) = InData(i2 + period2,6);
            % High. Low. Go back and recurse forward.
            max = InData(i2,4);
                for (j = i2:i2 + period2)
                    if (InData(j,4) > max)
                    max = InData(j,4);
                    end
                end
            NewData(k,4) = max;
            min = InData(i2,5);
                for (j = i2:i2 + period2)
                    if (InData(j,4) < min)
                    min = InData(j,5);
                    end
                end
            NewData(k,5) = min;
            NewData(k,2) = InData(i2,2); %+period2,2);
            NewData(k,1) = InData(i2,1); %+period2,1);
            NewData(k,7) = sum(InData(i2:i2+period2,7));
            NewData(k,8) = sum(InData(i2:i2+period2,8));
            i = i2 + period2 + 1;
            k = k + 1;
            
        %{
        else
            
            % Look back period cuts into second portion.
            % Igonre for now. We never get here.
            period2 = period - 88;
            
            % Open.
            NewData(k,1) = InData(i2,3);
            % Close.
            NewData(k,4) = InData(i2 + period2,6);
            % High. Low. Go back and recurse forward.
            max = InData(i2,4);
                for (j = i2:i2 + period2)
                    if (InData(j,4) > max)
                    max = InData(j,4);
                    end
                end
            NewData(k,2) = max;
            min = InData(i2,5);
                for (j = i2:i2 + period2)
                    if (InData(j,4) < min)
                    min = InData(j,5);
                    end
                end
            NewData(k,3) = min;
            NewData(k,5) = InData(i2+period2,2);
            NewData(k,6) = InData(i2+period2,1);
            i = i2 + period2 + 1;
            k = k + 1;
            
            
            
        end
        %}
    else if ( min2time(InData(i,2),period) > 1705 )
            
            clear period2;
            clear i2;
            i2 = i;
            period2 = mindiff(InData(i,2),1705);
            %period2 = 1665 - InData(i,2);
            % Open.
            NewData(k,3) = InData(i2,3);
            % Close.
            NewData(k,6) = InData(i2 + period2,6);
            % High. Low. Go back and recurse forward.
            max = InData(i2,4);
                for (j = i2:i2 + period2)
                    if (InData(j,4) > max)
                    max = InData(j,4);
                    end
                end
            NewData(k,4) = max;
            min = InData(i2,5);
                for (j = i2:i2 + period2)
                    if (InData(j,4) < min)
                    min = InData(j,5);
                    end
                end
            NewData(k,5) = min;
            NewData(k,2) = InData(i2,2); %+period2,2);
            NewData(k,1) = InData(i2,1); %+period2,1);
            NewData(k,7) = sum(InData(i2:i2+period2,7));
            NewData(k,8) = sum(InData(i2:i2+period2,8));
            i = i2 + period2 + 1;
            k = k + 1;
            
        else
        
    % Normal calculations here.
    
    % We calculate the open here.
    NewData(k,3) = InData(i,3);
    
    % We calculate the high here.
    max = InData(i,4);
    for (j = i:i+period)
        if (InData(j,4) > max)
            max = InData(j,4);
        end
        
    end
    NewData(k,4) = max;
    
    % We calculate the low here.
    min = InData(i,5);
    for (j = i:i+period)
        if (InData(j,5) < min)
            min = InData(j,5);
        end
        
    end
    NewData(k,5) = min;
    
    % We calculate the close here.
    NewData(k,6) = InData(i+period-1,6);
    % We write the time.
    NewData(k,2) = InData(i,2); %+period-1,2);
    NewData(k,1) = InData(i,1); %+period-1,1);
    NewData(k,7) = sum(InData(i:i+period-1,7));
    NewData(k,8) = sum(InData(i:i+period-1,8));
    i = i + period;
    k = k + 1;
        end
    end
    
    end

end

end