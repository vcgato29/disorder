clear

% %--------------------------------------------------------------------------
% %old
% %--------------------------------------------------------------------------
% str.NMD = '/home/jason/disorder2/lj/alloy/10K/0.05/10x/nmd_vc/work/1/';
% NMD=load(strcat(str.NMD,'NMDdata.mat'));
% str.save = '/home/jason/disorder2/lj/alloy/10K/0.05/10x/nmd_vc/work/1/';
% 
% m1 = 1; m2 = 3; c = 0.05; vm = (1-c)*m1 + c*m2
% 
% ALLOY =...
%     m_ld_defect_life_old(...
%     NMD,...
%     c , m1 , m2 , vm , 100 , 0.45 , 1);
% %--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%new
%--------------------------------------------------------------------------
str.NMD = '//home/jason/disorder2/lj/alloy/40K/0.5/14x/';
NMD=load(strcat(str.NMD,'nmd.mat'));
str.save = '/home/jason/disorder2/lj/alloy/40K/0.5/14x/';

m1 = 1; m2 = 3; c = 0.5; vm = (1-c)*m1 + c*m2
tic
ALLOY =...
    m_ld_defect_life(...
    NMD.freq,NMD.eigvec,NMD.NUM_MODES,NMD.NUM_KPTS,...
    NMD.x0.Nx,NMD.x0.Ny,NMD.x0.Nz,...
    c , m1 , m2 , vm , 100 , 0.45 , 1);
toc
%--------------------------------------------------------------------------


loglog(...
    ALLOY.freq, ALLOY.life(:,1),'.',...
    ALLOY.freq, 1E4*ALLOY.freq.^(-4)...
    )

save(strcat(str.save,'ALLOY.mat'), '-struct', 'ALLOY');



