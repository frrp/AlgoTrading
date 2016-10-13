% This function will read a CSV file downloaded from Yahoo! data.
% Then it will make the data continuous by filling in one-minute data at
% the gaps.

function [Data thename] = readdata(filestring)

% Delete all the prior data matrices.
clear thename;
clear Data;
clear DateData;
clear oneline;
nameoffile = filestring;
fileA = fopen( nameoffile ); % This is the name of the file we are opening.
oneline = textscan(fileA,'%s %s %s %s %s %s %s %s %s', 'delimiter',',');

format short;
period = 3; % This is the lookback period for our new matrix.

thename = cell2mat( oneline{1}(1,1) );
thename;
% We store the Date into a separate matrix.
clear tempstring;
clear tempnum;
tempstring = cell2mat( oneline{1}(4,1) ); 
temptime = tempstring(length(tempstring)-4:length(tempstring));
temptime = strrep(temptime,':','');
tempnum = str2num(temptime);
tempdate = tempstring(1: strfind(tempstring,' ')-1      );
tempdate = str2num( strrep(tempdate,'/','') );
Data(1,1) = tempdate;
Data(1,2) = tempnum;
Data(1,3) = str2num (cell2mat(oneline{2}(4,1)) );
Data(1,4) = str2num (cell2mat(oneline{3}(4,1)) );
Data(1,5) = str2num (cell2mat(oneline{4}(4,1)) );
Data(1,6) = str2num (cell2mat(oneline{5}(4,1)) );
Data(1,7) = str2num (cell2mat(oneline{6}(4,1)) );
Data(1,8) = str2num (cell2mat(oneline{7}(4,1)) );


i = 5; j = 2;
while (i < length(oneline{1}) )

   clear tempstring;
   clear tempnum;
   tempstring = cell2mat( oneline{1}(i,1) ); 
   temptime = tempstring(length(tempstring)-4:length(tempstring));
   temptime = strrep(temptime,':','');
   tempnum = str2num(temptime);
   pre = Data(j-1,2);
   pre = pre + 1;
   tempdate = tempstring(1: strfind(tempstring,' ')-1      );
   tempdate = str2num( strrep(tempdate,'/','') );
   
   
   
   % Check if crosses the hour.
   if ( rem(pre,100) == 60 )
       pre = pre - 60;
       pre = pre + 100;
   end
     
   if (tempdate ~= Data(j-1,1)  || (1230 <= pre && pre <= 1359) ) % The condition here must be start of new date.
        Data(j,1) = tempdate;
        Data(j,2) = tempnum;
        Data(j,3) = str2num (cell2mat(oneline{2}(i,1)) );
        Data(j,4) = str2num (cell2mat(oneline{3}(i,1)) );
        Data(j,5) = str2num (cell2mat(oneline{4}(i,1)) );
        Data(j,6) = str2num (cell2mat(oneline{5}(i,1)) );
        Data(j,7) = str2num (cell2mat(oneline{6}(i,1)) );
        Data(j,8) = str2num (cell2mat(oneline{7}(i,1)) );
        i = i + 1;
        i / length(oneline{1}) * 100
        j = j + 1;
   else
        % Condition to check whether we should fill up the discontinuous
        % data.
        if (tempnum ~= pre)
           Data(j,1) = tempdate;
           Data(j,2) = pre;
           Data(j,3:6) = Data(j-1,6);
           Data(j,7:8) = 0;
           j = j + 1;
        else
   
        Data(j,1) = tempdate;
        Data(j,2) = tempnum;
        Data(j,3) = str2num (cell2mat(oneline{2}(i,1)) );
        Data(j,4) = str2num (cell2mat(oneline{3}(i,1)) );
        Data(j,5) = str2num (cell2mat(oneline{4}(i,1)) );
        Data(j,6) = str2num (cell2mat(oneline{5}(i,1)) );
        Data(j,7) = str2num (cell2mat(oneline{6}(i,1)) );
        Data(j,8) = str2num (cell2mat(oneline{7}(i,1)) );
        i = i + 1;
        i / length(oneline{1}) * 100
        j = j + 1;
        end
 
   end
    
end

fclose(fileA);

% This is where we apply the period to get New Data matrix.
clear NewData;
% We calculate the open here.

i = period;
while (i < ceil ( (length(oneline{1})-1)  ))
    
    NewData(i/period,1) = Data(i-period+1,3);
    i = i + period;
    
end

% We calculate the high here.

i = period;
while (i < ceil ( (length(oneline{1})-1)  ))
    
    max = Data(i-period+1,4);
    for (j = i-period+1:i)
        if (Data(j,4) > max)
            max = Data(j,4);
        end
        
    end
    NewData(i/period,2) = max;
    i = i + period;
    
end

% We calculate the low here.

i = period;
while (i < ceil ( (length(oneline{1})-1)  ))
    
    min = Data(i-period+1,5);
    for (j = i-period+1:i)
        if (Data(j,5) < min)
            min = Data(j,4);
        end
        
    end
    NewData(i/period,3) = min;
    i = i + period;
    
end

% We calculate the close here.

i = period;
while (i < ceil ( (length(oneline{1})-1)  ))
    
    NewData(i/period,4) = Data(i-period+1,6);
    i = i + period;
    
end

end