
m_ld_defect_life( NMD , SED )

str.NMD = '/home/jason/orderdisorder/lj/alloy/10K/0.0/10x/NMD/1';
SEDper=load(strcat(str.NMD,'/SEDdata.mat'));
NMD=load(strcat(str.NMD,'/NMDdata.mat'));
SEDper = nmd_convert_data(NMD,SEDper);

str.NMD = '/home/jason/orderdisorder/lj/alloy/10K/0.5/10x/NMD/1';
SED=load(strcat(str.NMD,'/SEDdata.mat'));
NMDalloy=load(strcat(str.NMD,'/NMDdata.mat'));
SED = nmd_convert_data(NMDalloy,SED);

ALLOY = m_ld_defect_life( NMD , SED );

save(strcat(str.NMD,'/ALLOY.mat'), '-struct', 'ALLOY');

[I,J] = sort(ALLOY.freq);
%calculate /tau = 1 / (1/\tau_d + 1/\tau_{p-p})
loglog(...
    SEDper.sedfreq,SEDper.life/NMD.LJ.tau,'.',...
    SED.sedfreq,SED.life/NMD.LJ.tau,'.',...
    ALLOY.freq, ALLOY.life,'.',...
    ALLOY.freq , 1./(1./(ALLOY.life') + 1./(SEDper.life/NMD.LJ.tau) ),'.',...
    ALLOY.freq, 1E4*ALLOY.freq.^(-4)...
    )

% alloy_phonon_lifetimes_defects_createfigure(...
%     SEDper.sedfreq,...
%     SEDper.life/NMD.LJ.tau,...
%     SED.sedfreq,...
%     SED.life/NMD.LJ.tau,...
%     ALLOY.freq,...
%     [ALLOY.life' 1./(1./(ALLOY.life') + 1./(SEDper.life/NMD.LJ.tau) ) 1E4*ALLOY.freq.^(-4) ]...
%     )





