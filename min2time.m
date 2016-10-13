% Function to add minutes to a time.
% To facilitate calculations with the one minute data.

function restime = min2time(time,add)

clear resttime;
% First convert time to minutes.
hr = time - rem(time,100);

min = rem(time, 100);

resmin = (hr / 100) * 60 + min;
restime = resmin + add;

% Convert back to 24-hour clock format.

restime = (floor (restime/60)) * 100 + rem(restime,60);


end