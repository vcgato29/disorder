function m_alloy_nmd_gamma_life_createfigure(X1, Y1, X2, Y2, X3, YMatrix1, X4, Y3, X5, Y4, X6, YMatrix2, X7, Y5, X8, Y6, X9, YMatrix3)
%CREATEFIGURE(X1,Y1,X2,Y2,X3,YMATRIX1,X4,Y3,X5,Y4,X6,YMATRIX2,X7,Y5,X8,Y6,X9,YMATRIX3)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data
%  X3:  vector of x data
%  YMATRIX1:  matrix of y data
%  X4:  vector of x data
%  Y3:  vector of y data
%  X5:  vector of x data
%  Y4:  vector of y data
%  X6:  vector of x data
%  YMATRIX2:  matrix of y data
%  X7:  vector of x data
%  Y5:  vector of y data
%  X8:  vector of x data
%  Y6:  vector of y data
%  X9:  vector of x data
%  YMATRIX3:  matrix of y data

%  Auto-generated by MATLAB on 28-Oct-2012 17:03:19

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'Units','inches',...
    'Position',[0.560444444444444 4.11111111111112 3.5 1.75]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[1.50001 29.9999]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.10001 200]);
box(axes1,'on');
hold(axes1,'all');

% Create loglog
loglog(X1,Y1,'Parent',axes1,'Marker','o','LineStyle','none',...
    'DisplayName','Gamma');

% Create loglog
loglog(X2,Y2,'Parent',axes1,'MarkerSize',15,'Marker','.','LineStyle','none',...
    'DisplayName','VC');

% Create multiple lines using matrix input to loglog
loglog1 = loglog(X3,YMatrix1,'Parent',axes1);
set(loglog1(1),'DisplayName','$\omega^{-4}$');
set(loglog1(2),'DisplayName','$\omega^{-2}$');
set(loglog1(3),'DisplayName','$2\pi/\omega$');

% Create axes
axes2 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'Units','inches',...
    'Position',[0.560444444444444 2.35555555555556 3.5 1.75]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes2,[1.500001 29.9999]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes2,[0.1001 200]);
box(axes2,'on');
hold(axes2,'all');

% Create loglog
loglog(X4,Y3,'Parent',axes2,'Marker','o','LineStyle','none');

% Create loglog
loglog(X5,Y4,'Parent',axes2,'MarkerSize',15,'Marker','.','LineStyle','none');

% Create multiple lines using matrix input to loglog
loglog(X6,YMatrix2,'Parent',axes2);

% Create ylabel
ylabel({'$\tau$ (LJ units)'},'Interpreter','latex','FontSize',12);

% Create axes
axes3 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'Units','inches',...
    'Position',[0.560444444444444 0.609888888888888 3.5 1.75]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes3,[1.5 30]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes3,[0.1 200]);
box(axes3,'on');
hold(axes3,'all');

% Create loglog
loglog(X7,Y5,'Parent',axes3,'Marker','o','LineStyle','none');

% Create loglog
loglog(X8,Y6,'Parent',axes3,'MarkerSize',15,'Marker','.','LineStyle','none');

% Create multiple lines using matrix input to loglog
loglog(X9,YMatrix3,'Parent',axes3);

% Create xlabel
xlabel({'$\omega$ (LJ units)'},'Interpreter','latex','FontSize',12);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex','EdgeColor',[1 1 1],'YColor',[1 1 1],...
    'XColor',[1 1 1],...
    'Units','inches',...
    'Position',[0.620833333333334 2.51388888888889 1.03472222222222 0.719444444444443],...
    'FontSize',11);

% Create textbox
annotation(figure1,'textbox',...
    [0.766463917525773 0.889090909090909 0.140752577319588 0.0527272727272727],...
    'Interpreter','latex',...
    'String',{'c=0.05'},...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.773577319587629 0.592727272727273 0.140752577319588 0.0527272727272727],...
    'Interpreter','latex',...
    'String',{'c=0.15'},...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.776154639175258 0.312727272727272 0.140752577319588 0.0527272727272727],...
    'Interpreter','latex',...
    'String',{'c=0.5'},...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
