% We take in the matrix called Data and write it to a file called
% writetest.csv.

function writetofile(Data,name,filename)

fid = fopen(filename,'w');

fprintf(fid,strcat(name,'\n'));
fprintf(fid,'Date,OPEN,HIGH,LOW,LAST_PRICE,VOLUME,Value\n');



for (i = 1:length(Data(:,1)))
    
thisdate = num2str( Data(i,1) );
% We changed this line.
thisdate = strcat([thisdate(1:length(thisdate)-4) '/' thisdate(length(thisdate)-3:length(thisdate)-2) '/' thisdate(length(thisdate)-1:length(thisdate))]);
    
fprintf(fid,'%s ',thisdate);
thistime = num2str( Data(i,2) );
i / length(Data(:,1)) * 100
thistime = strcat([thistime(1:length(thistime)-2) ':' thistime(length(thistime)-1:length(thistime)) ]);

fprintf(fid,'%s,',thistime);

fprintf(fid,'%3.2f,%3.2f,%3.2f,%3.2f,%.0f,%.0f\n',Data(i,3:8));


end

fclose(fid);

end