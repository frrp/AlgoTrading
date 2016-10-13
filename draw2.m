% This draws the main display, showing three indicators - Bellinger,
% Stochastic and MACD - and their enter, exit strategy. We also calculate
% various PnL and ratios to see how profitable is this strategy.

function draw2(S)
    
    close all;
    % We first plot the three indicators.
    

    % The Bollinger band indicator.
    subplot(9,5,[1:3 6:8 11:13])
    stddev(S);
    % subplot(9,5,[4:5 9:10 14:15])

    % The stochastic indicator.
    subplot(9,5,[16:18 21:23 26:28])
    stoc(S,14,3,3);
    
    subplot(9,5,[31:33 36:38 41:43])
    MACD(S,16,26,9);

    oneent = uicontrol('style','text','Position',[0.6 0.8 0.35 0.1],'Units','normalized');
    set(oneent,'String','Bollinger - Enter Strategy: The First time the price closed below the lower band.');
    set(oneent,'Units','characters');
    
    oneext = uicontrol('style','text','Position',[0.6 0.7 0.35 0.1],'Units','normalized');
    set(oneext,'String','Bollinger - Exit Strategy: When the close price decreases twice in a row.');
    set(oneext,'Units','characters');
    
    twoent = uicontrol('style','text','Position',[0.6 0.5 0.35 0.1],'Units','normalized');
    set(twoent,'String','Stochastic - Enter Strategy: Stochastic Indicator intercepts 20% from below.');
    set(twoent,'Units','characters');
    
    twoext = uicontrol('style','text','Position',[0.6 0.4 0.35 0.1],'Units','normalized');
    set(twoext,'String','Stochastic - Exit Strategy: Stochastic Indicator crosses 80% and then intercepts 60% from above.');
    set(twoext,'Units','characters');
    
    treent = uicontrol('style','text','Position',[0.6 0.2 0.35 0.1],'Units','normalized');
    set(treent,'String','MACD - Enter Strategy: When MACD(red) crosses Signal(blue) from above.');
    set(treent,'Units','characters');
    
    treext = uicontrol('style','text','Position',[0.6 0.1 0.35 0.1],'Units','normalized');
    set(treext,'String','MACD - Exit Strategy: When MACD(red) crosses Signal(blue) from below.');
    set(treext,'Units','characters');
    
    set([oneent oneext twoent twoext treent treext],'FontName','Monaco');
end