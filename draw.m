% Draw everything with default values.

function draw(S)
        
    close all;
    figure;
    stddev(S);
    figure;
    stoc(S,14,3,3);
    figure;
    movavg(S,20);
    figure;
    expavg(S,20);
    figure;
    MACD(S,16,26,9);

end