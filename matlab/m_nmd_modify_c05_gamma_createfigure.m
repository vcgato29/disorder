function m_nmd_modify_c05_gamma_createfigure(X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6)
%CREATEFIGURE(X1,Y1,X2,Y2,X3,Y3,X4,Y4)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data
%  X3:  vector of x data
%  Y3:  vector of y data
%  X4:  vector of x data
%  Y4:  vector of y data

%  Auto-generated by MATLAB on 08-Oct-2012 11:18:02

% Create figure
figure1 = figure('XVisual',...
    '0x94 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)');

% Create axes
axes1 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'Units','inches',...
    'Position',[0.744444444444445 0.596444444444444 3.75 3.75]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[1.84470075675564 30.5394236864547]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.0456702013893255 83.8934167110993]);
box(axes1,'on');
hold(axes1,'all');

% Create loglog
loglog(X1,Y1,'Parent',axes1,'MarkerSize',20,'Marker','.','LineStyle','none',...
    'DisplayName','nmd+vc+disorder');

% Create loglog
loglog(X2,Y2,'Parent',axes1,'Marker','.','LineStyle','none',...
    'DisplayName','ald+taud');

% Create loglog
loglog(X3,Y3,'Parent',axes1,'Marker','.','LineStyle','none',...
    'DisplayName','nmd+gamma+disorder');

% Create loglog
loglog(X4,Y4,'Parent',axes1,'DisplayName','$2\pi/\omega$');

% Create loglog
loglog(X5,Y5,'Parent',axes1,'DisplayName','$1 / \omega^4$');

% Create loglog
loglog(X6,Y6,'Parent',axes1,'DisplayName','$1 / \omega^2$');

% Create xlabel
xlabel({'$\omega$ (LJ units)'},'Interpreter','latex','FontSize',15);

% Create ylabel
ylabel({'$\tau$ (LJ units)'},'Interpreter','latex','FontSize',15);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex','Units','inches',...
    'Position',[0.819444444444447 0.729947916666667 2.20555555555556 0.858940972222222],...
    'FontSize',11);


