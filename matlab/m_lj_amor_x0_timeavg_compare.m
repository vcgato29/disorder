clear

str.main = '/home/jason/disorder2/lj/amor/4x/XCORR_AF/10K/';

%check 5K time avg
data =...
    m_lmp_readdump_all([str.main 'lmp.x.dump']);

for idump = 2:size(data.atom_data,3)
    idump
plot3(...
    data.atom_data(:,1,idump),...
    data.atom_data(:,2,idump),...
    data.atom_data(:,3,idump),'.'...
    )
plot(...
    data.atom_data(:,1,idump),...
    data.atom_data(:,3,idump),'.'...
    )
axis([0 7 0 7])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
% plot3(...
%     data.atom_data(:,1,idump-1) - data.atom_data(:,1,idump),...
%     data.atom_data(:,2,idump-1) - data.atom_data(:,2,idump),...
%     data.atom_data(:,3,idump-1) - data.atom_data(:,3,idump),'.'...
%     )
% %--------------------------------------------------------------------------
% pause
% %--------------------------------------------------------------------------
end

%open log
log =...
    m_lmp_readlog([str.main 'log.lammps']);
array = str2num(log.data{3});

plot(...
    array(:,1),array(:,2)/mean(array(:,2)),'.',...
    array(:,1),array(:,3)/mean(array(:,3)),'.'...
    )

plot(...
    array(:,1),array(:,8)/mean(array(:,8)),'.'...
    )












% x_timeavg =...
%     load(...
%     '/home/jason/disorder2/lj/amor/4x/prepare/tmp/lmp.x.nvt.dump.1.1.matlab');
% 
% x0K =...
%     m_x0_read('/home/jason/disorder2/lj/amor/4x/prepare/tmp/x0K_1.data');
% 
% x0 =...
%     m_x0_read('/home/jason/disorder2/lj/amor/4x/prepare/tmp/x0_1.data');
% 
% plot3(...
%     x_timeavg(:,1),x_timeavg(:,2),x_timeavg(:,3),'.',...
%     x0.x,x0.y,x0.z,'.',...
%     x0K.x,x0K.y,x0K.z,'.'...
%     )
% %--------------------------------------------------------------------------
% pause
% %--------------------------------------------------------------------------
% I = find(...
%     abs(x0.x - x_timeavg(:,1)) < 2.0 & ...
%     abs(x0.y - x_timeavg(:,2)) < 2.0 & ...
%     abs(x0.z - x_timeavg(:,3)) < 2.0 ...
%     );
% plot3(...
%     x0.x(I) - x_timeavg(I,1),x0.y(I) - x_timeavg(I,2),x0.z(I) - x_timeavg(I,3),'.'...
%     )
% %--------------------------------------------------------------------------
% pause
% %--------------------------------------------------------------------------
% I = find(...
%     abs(x0K.x - x_timeavg(:,1)) < 2.0 & ...
%     abs(x0K.y - x_timeavg(:,2)) < 2.0 & ...
%     abs(x0K.z - x_timeavg(:,3)) < 2.0 ...
%     );
% plot3(...
%     x0K.x(I) - x_timeavg(I,1),x0K.y(I) - x_timeavg(I,2),x0K.z(I) - x_timeavg(I,3),'.'...
%     )
% 
% %--------------------------------------------------------------------------
% clear
% %--------------------------------------------------------------------------


