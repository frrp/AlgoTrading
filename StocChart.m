function StocChart(look,x,y,ent,ext1,ext2,TICK,x1,x2,x3,x4,x5,x6,x7,x8,...
    x9,x10,x11,x12)

close all;
figure;
bkg = [0.9 0.9 0.9];

toplabel = uicontrol('style','text','String','Profit & Loss for our selected stocks',...
    'FontName','Monaco','FontSize',24,'Units','normalized','Position',[0.15,0.9,0.7,0.08]);

% UOL Box.

UOLBox = uibuttongroup('Parent',gcf,'Title','UOL',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.05 .7 .2 .15],'Units','normalized');    

UOLTitle = uicontrol('Parent',UOLBox,'style','text','String','UOL','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
UOLState = uicontrol('Parent',UOLBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

UOLpnl = uicontrol('Parent',UOLBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

UOLpnl2 = uicontrol('Parent',UOLBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

UOLpr = uicontrol('Parent',UOLBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

UOLpr2 = uicontrol('Parent',UOLBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

UOLbutton = uicontrol('Parent',UOLBox,'style','pushbutton','String','UOL','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);


% OSIM Box.

OSIMBox = uibuttongroup('Parent',gcf,'Title','OSIM',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.05 .5 .2 .15],'Units','normalized');

OSIMTitle = uicontrol('Parent',OSIMBox,'style','text','String','OSIM','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
OSIMState = uicontrol('Parent',OSIMBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

OSIMpnl = uicontrol('Parent',OSIMBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

OSIMpnl2 = uicontrol('Parent',OSIMBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

OSIMpr = uicontrol('Parent',OSIMBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

OSIMpr2 = uicontrol('Parent',OSIMBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

OSIMbutton = uicontrol('Parent',OSIMBox,'style','pushbutton','String','OSIM','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);

% WILMAR Box.
    
WILMARBox = uibuttongroup('Parent',gcf,'Title','WILMAR',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.05 .3 .2 .15],'Units','normalized');    

WILMARTitle = uicontrol('Parent',WILMARBox,'style','text','String','WILMAR','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
WILMARState = uicontrol('Parent',WILMARBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

WILMARpnl = uicontrol('Parent',WILMARBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

WILMARpnl2 = uicontrol('Parent',WILMARBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

WILMARpr = uicontrol('Parent',WILMARBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

WILMARpr2 = uicontrol('Parent',WILMARBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

WILMARbutton = uicontrol('Parent',WILMARBox,'style','pushbutton','String','WILMAR','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);
    
% CREATIVE Box.
    
CREATIVEBox = uibuttongroup('Parent',gcf,'Title','CREATIVE',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.3 .7 .2 .15],'Units','normalized');
    
CREATIVETitle = uicontrol('Parent',CREATIVEBox,'style','text','String','CREATIVE','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
CREATIVEState = uicontrol('Parent',CREATIVEBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

CREATIVEpnl = uicontrol('Parent',CREATIVEBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

CREATIVEpnl2 = uicontrol('Parent',CREATIVEBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

CREATIVEpr = uicontrol('Parent',CREATIVEBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

CREATIVEpr2 = uicontrol('Parent',CREATIVEBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

CREATIVEbutton = uicontrol('Parent',CREATIVEBox,'style','pushbutton','String','CREATIVE','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);
    

% KIMENG Box.    
    
KIMENGBox = uibuttongroup('Parent',gcf,'Title','KIM ENG',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.3 .5 .2 .15],'Units','normalized');
    
KIMENGTitle = uicontrol('Parent',KIMENGBox,'style','text','String','KIMENG','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
KIMENGState = uicontrol('Parent',KIMENGBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

KIMENGpnl = uicontrol('Parent',KIMENGBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

KIMENGpnl2 = uicontrol('Parent',KIMENGBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

KIMENGpr = uicontrol('Parent',KIMENGBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

KIMENGpr2 = uicontrol('Parent',KIMENGBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

KIMENGbutton = uicontrol('Parent',KIMENGBox,'style','pushbutton','String','KIMENG','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);    
 
% UOB Box.
    
UOBBox = uibuttongroup('Parent',gcf,'Title','UOB',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.3 .3 .2 .15],'Units','normalized');    

UOBTitle = uicontrol('Parent',UOBBox,'style','text','String','UOB','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
UOBState = uicontrol('Parent',UOBBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

UOBpnl = uicontrol('Parent',UOBBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

UOBpnl2 = uicontrol('Parent',UOBBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

UOBpr = uicontrol('Parent',UOBBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

UOBpr2 = uicontrol('Parent',UOBBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

UOBbutton = uicontrol('Parent',UOBBox,'style','pushbutton','String','UOB','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);      
    
% SIA Box.
    
SIABox = uibuttongroup('Parent',gcf,'Title','SIA',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.55 .7 .2 .15],'Units','normalized');    

SIATitle = uicontrol('Parent',SIABox,'style','text','String','SIA','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
SIAState = uicontrol('Parent',SIABox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

SIApnl = uicontrol('Parent',SIABox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

SIApnl2 = uicontrol('Parent',SIABox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

SIApr = uicontrol('Parent',SIABox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

SIApr2 = uicontrol('Parent',SIABox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

SIAbutton = uicontrol('Parent',SIABox,'style','pushbutton','String','SIA','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);
    
% F&N Box.    
    
FandNBox = uibuttongroup('Parent',gcf,'Title','FandN',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.55 .5 .2 .15],'Units','normalized');

FandNTitle = uicontrol('Parent',FandNBox,'style','text','String','FandN','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
FandNState = uicontrol('Parent',FandNBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

FandNpnl = uicontrol('Parent',FandNBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

FandNpnl2 = uicontrol('Parent',FandNBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

FandNpr = uicontrol('Parent',FandNBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

FandNpr2 = uicontrol('Parent',FandNBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

FandNbutton = uicontrol('Parent',FandNBox,'style','pushbutton','String','FandN','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);    
    
% KEPCORP Box.
    
KEPCORPBox = uibuttongroup('Parent',gcf,'Title','KEPCORP',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.55 .3 .2 .15],'Units','normalized'); 

KEPCORPTitle = uicontrol('Parent',KEPCORPBox,'style','text','String','KEPCORP','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
KEPCORPState = uicontrol('Parent',KEPCORPBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

KEPCORPpnl = uicontrol('Parent',KEPCORPBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

KEPCORPpnl2 = uicontrol('Parent',KEPCORPBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

KEPCORPpr = uicontrol('Parent',KEPCORPBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

KEPCORPpr2 = uicontrol('Parent',KEPCORPBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

KEPCORPbutton = uicontrol('Parent',KEPCORPBox,'style','pushbutton','String','KEPCORP','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);     
    
% STARHUB Box.

STARHUBBox = uibuttongroup('Parent',gcf,'Title','STARHUB',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.8 .7 .2 .15],'Units','normalized'); 

STARHUBTitle = uicontrol('Parent',STARHUBBox,'style','text','String','STARHUB','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
STARHUBState = uicontrol('Parent',STARHUBBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

STARHUBpnl = uicontrol('Parent',STARHUBBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

STARHUBpnl2 = uicontrol('Parent',STARHUBBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

STARHUBpr = uicontrol('Parent',STARHUBBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

STARHUBpr2 = uicontrol('Parent',STARHUBBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

STARHUBbutton = uicontrol('Parent',STARHUBBox,'style','pushbutton','String','STARHUB','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis); 

% DBS Box.

DBSBox = uibuttongroup('Parent',gcf,'Title','DBS',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.8 .5 .2 .15],'Units','normalized');

DBSTitle = uicontrol('Parent',DBSBox,'style','text','String','DBS','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
DBSState = uicontrol('Parent',DBSBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

DBSpnl = uicontrol('Parent',DBSBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

DBSpnl2 = uicontrol('Parent',DBSBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

DBSpr = uicontrol('Parent',DBSBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

DBSpr2 = uicontrol('Parent',DBSBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

DBSbutton = uicontrol('Parent',DBSBox,'style','pushbutton','String','DBS','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);    
    
% SPH Box.
    
SPHBox = uibuttongroup('Parent',gcf,'Title','SPH',...
        'BackgroundColor',[0.9 0.9 0.9],'FontName','Monaco',... 
        'Position',[.8 .3 .2 .15],'Units','normalized');    

SPHTitle = uicontrol('Parent',SPHBox,'style','text','String','STARHUB','FontName','Monaco','FontSize',24,'units','normalized',...
    'Position',[0.1,0.5,0.5,0.4],'BackgroundColor',bkg);
    
SPHState = uicontrol('Parent',SPHBox,'style','text','String','NIL','FontName','Monaco','FontSize',20,'units','normalized',...
    'Position',[0.1,0.05,0.5,0.4],'BackgroundColor',bkg);

SPHpnl = uicontrol('Parent',SPHBox,'style','text','String','PnL:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.7,0.16,0.2],'BackgroundColor',bkg);

SPHpnl2 = uicontrol('Parent',SPHBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.7,0.16,0.2],'BackgroundColor',bkg);

SPHpr = uicontrol('Parent',SPHBox,'style','text','String','Pr:','FontName','Monaco','FontSize',8,'units','normalized',...
    'Position',[0.65,0.5,0.16,0.2],'BackgroundColor',bkg);

SPHpr2 = uicontrol('Parent',SPHBox,'style','text','String','$-','FontName','Monaco','FontSize',10,'units','normalized',...
    'Position',[0.8,0.5,0.16,0.2],'BackgroundColor',bkg);

SPHbutton = uicontrol('Parent',SPHBox,'style','pushbutton','String','STARHUB','FontName','Monaco','FontSize',12,'units','normalized',...
    'Position',[0.6,0.05,0.3,0.2],'BackgroundColor',bkg,'Callback',@chartthis);    
    
function chartthis(hObject,src,evt)
    inname = get(hObject,'String')
    switch inname
        case {'UOL'}
        stocdisplay(x1,look,x,y,ent,ext1,ext2);
        case {'OSIM'}
        stocdisplay(x2,look,x,y,ent,ext1,ext2);
        case {'WILMAR'}
        stocdisplay(x3,look,x,y,ent,ext1,ext2);
        case {'CREATIVE'}
        stocdisplay(x4,look,x,y,ent,ext1,ext2);
        case {'KIMENG'}
        stocdisplay(x5,look,x,y,ent,ext1,ext2);
        case {'UOB'}
        stocdisplay(x6,look,x,y,ent,ext1,ext2);
        case {'SIA'}
        stocdisplay(x7,look,x,y,ent,ext1,ext2);
        case {'FandN'}
        stocdisplay(x8,look,x,y,ent,ext1,ext2);
        case {'KEPCORP'}
        stocdisplay(x9,look,x,y,ent,ext1,ext2);
        case {'STARHUB'}
        stocdisplay(x10,look,x,y,ent,ext1,ext2);
        case {'DBS'}
        stocdisplay(x11,look,x,y,ent,ext1,ext2);
        case {'SPH'}
        stocdisplay(x12,look,x,y,ent,ext1,ext2);
    end
% We will open our other .m file StocChart.    
    
end    
    
set(gcf,'Position',[100 500 1200 900],'Name','Profit & Loss for our selected stocks');

% Now we check our TICK matrix and see for which stocks would we want to
% calculate the profit, price.

for (j = 1:4)
    for (i=1:3)
        if (TICK(i,j) == 1)
            pos = i + (j - 1) * 3;
            
            switch pos % We match up the position with the stock.
                case {1}
                [pnl pr] = stoccalc(x1,look,x,y,ent,ext1,ext2);
                set(UOLpnl2,'String',[num2str(pnl)]);
                set(UOLpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(UOLState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(UOLTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(UOLState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {2}
                [pnl pr] = stoccalc(x2,look,x,y,ent,ext1,ext2);
                set(OSIMpnl2,'String',[num2str(pnl)]);
                set(OSIMpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(OSIMState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(OSIMTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(OSIMState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {3}
                [pnl pr] = stoccalc(x3,look,x,y,ent,ext1,ext2);
                set(WILMARpnl2,'String',[num2str(pnl)]);
                set(WILMARpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(WILMARState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(WILMARTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(WILMARState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {4}
                [pnl pr] = stoccalc(x4,look,x,y,ent,ext1,ext2);
                set(CREATIVEpnl2,'String',[num2str(pnl)]);
                set(CREATIVEpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(CREATIVEState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(CREATIVETitle,'ForegroundColor',[0 0.4 1])
                else
                    set(CREATIVEState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {5}
                [pnl pr] = stoccalc(x5,look,x,y,ent,ext1,ext2);
                set(KIMENGpnl2,'String',[num2str(pnl)]);
                set(KIMENGpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(KIMENGState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(KIMENGTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(KIMENGState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {6}
                [pnl pr] = stoccalc(x6,look,x,y,ent,ext1,ext2);
                set(UOBpnl2,'String',[num2str(pnl)]);
                set(UOBpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(UOBState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(UOBTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(UOBState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {7}
                [pnl pr] = stoccalc(x7,look,x,y,ent,ext1,ext2);
                set(SIApnl2,'String',[num2str(pnl)]);
                set(SIApr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(SIAState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(SIATitle,'ForegroundColor',[0 0.4 1])
                else
                    set(SIAState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {8}
                [pnl pr] = stoccalc(x8,look,x,y,ent,ext1,ext2);
                set(FandNpnl2,'String',[num2str(pnl)]);
                set(FandNpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(FandNState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(FandNTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(FandNState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {9}
                [pnl pr] = stoccalc(x9,look,x,y,ent,ext1,ext2);
                set(KEPCORPpnl2,'String',[num2str(pnl)]);
                set(KEPCORPpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(KEPCORPState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(KEPCORPTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(KEPCORPState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {10}
                [pnl pr] = stoccalc(x10,look,x,y,ent,ext1,ext2);
                set(STARHUBpnl2,'String',[num2str(pnl)]);
                set(STARHUBpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(STARHUBState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(STARHUBTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(STARHUBState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {11}
                [pnl pr] = stoccalc(x11,look,x,y,ent,ext1,ext2);
                set(DBSpnl2,'String',[num2str(pnl)]);
                set(DBSpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(DBSState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(DBSTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(DBSState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
                case {12}
                [pnl pr] = stoccalc(x12,look,x,y,ent,ext1,ext2);
                set(SPHpnl2,'String',[num2str(pnl)]);
                set(SPHpr2,'String',[num2str(pr)]);
                if (pnl > 0)
                    set(SPHState,'String','GOOD','ForegroundColor',[0 0.4 1])
                    set(SPHTitle,'ForegroundColor',[0 0.4 1])
                else
                    set(SPHState,'String','BAD','ForegroundColor',[0.85 0 0.2])
                end
                
            end
                    
        end
    end
end




end