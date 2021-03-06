% A function to calculate the difference in minutes between two 24-hour
% times.

function diff = mindiff(time1,time2)

% Convert both times to minutes.

hr1 = time1 - rem(time1,100);

min1 = rem(time1, 100);

time1_min = (hr1 / 100) * 60 + min1;

hr2 = time2 - rem(time2,100);

min2 = rem(time2, 100);

time2_min = (hr2 / 100) * 60 + min2;

diff = time2_min - time1_min;

end
