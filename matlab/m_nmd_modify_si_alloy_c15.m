%function m_ald_taud_si(str_ald,str_nmd_per,str_nmd_vc,str_alloy)
%--------------------------------------------------------------------------
%m_ald_taud(str_ald,str_nmd_perfect,str_nmd_vc,str_alloy)
% m_ald_taud(...
% '/home/jason/disorder/lj/ald/m1.1/10x/Data_fullBZ.xls',...
% '/home/jason/disorder2/lj/alloy/10K/0.05/10x/nmd_vc/work/1/',...
% '/home/jason/disorder2/lj/alloy/10K/0.05/10x/NMD/1/work/',...
% '/home/jason/disorder2/lj/alloy/10K/0.05/10x/nmd_vc/work/1/')
%--------------------------------------------------------------------------

clear

constant = m_constant;

sys_size = '8x';

%--------------------------------------------------------------------------
%load
%-------------------------------------------------------------------------- 
ipt = 1;
str_ald = ['/home/jason/disorder2/si/ald/conv/' sys_size '/Data_fullBZ.xls'];
str_alloy = ['/home/jason/disorder2/si/alloy/0.15/' sys_size '/'];
str_nmd = ['/home/jason/disorder2/si/alloy/0.15/' sys_size '/'];
nmd=load(strcat(str_nmd,'nmd.mat'));
ald = m_joe_read_data_si(str_ald);
alloy = load(strcat(str_alloy,'ALLOY.mat'));


aldsed =...
    m_joe_ald2nmd_si(...
    nmd.NUM_KPTS, nmd.kptmodelist , nmd.NUM_MODES , ald );

cond_aldsed =...
    m_ald_cond(...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),...
    aldsed.vel(:,1)/sqrt(nmd.x0.vm),...
    nmd.x0.VOLUME*constant.ang2m^3)
%initialize
nmdnew.kpt = aldsed.kpt; nmdnew.freq = aldsed.freq/sqrt(nmd.x0.vm);
nmdnew.vel = aldsed.vel/sqrt(nmd.x0.vm); 
%give nmdnew aldsed+taud
nmdnew.life = (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) ));
nmdnew.VOLUME = nmd.x0.VOLUME;

%-------------------------------------------------------------------------- 
%--------------------------------------------------------------------------
%NMD VC CHANGES
%-------------------------------------------------------------------------- 
%--------------------------------------------------------------------------
%1
reso1 = 0.01E-11; reso2 = 0.01E12;
[I,J] = find(...
    9.294E-12 - reso1 < nmdnew.life & nmdnew.life < 1.409E-11 + reso1 &...
    6.379E12 - reso2 < nmdnew.freq & nmdnew.freq < 7.322E12 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.75;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%1
reso1 = 0.01E-11; reso2 = 0.01E12;
[I,J] = find(...
    9.294E-12 - reso1 < nmdnew.life & nmdnew.life < 1.409E-11 + reso1 &...
    6.0E12 - reso2 < nmdnew.freq & nmdnew.freq < 7.322E12 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.5;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%2
reso1 = 0.01E-11; reso2 = 0.01E13;
[I,J] = find(...
    3.492E-12 - reso1 < nmdnew.life & nmdnew.life < 4.158E-12 + reso1 &...
    9.143E12 - reso2 < nmdnew.freq & nmdnew.freq < 1.045E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.7;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%2
reso1 = 0.01E-11; reso2 = 0.01E13;
[I,J] = find(...
    1.0E-12 - reso1 < nmdnew.life & nmdnew.life < 4.0E-12 + reso1 &...
    1.045E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.045E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.8;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%3
reso1 = 0.01E-11; reso2 = 0.01E12;
[I,J] = find(...
    1.167E-12 - reso1 < nmdnew.life & nmdnew.life < 1.28E-12 + reso1 &...
    1.242E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.267E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.2;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%4
reso1 = 0.01E-11; reso2 = 0.01E12;
[I,J] = find(...
    5.626E-13 - reso1 < nmdnew.life & nmdnew.life < 7.498E-13 + reso1 &...
    1.369E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.436E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.8;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%4
reso1 = 0.01E-11; reso2 = 0.01E12;
[I,J] = find(...
    5.694E-13 - reso1 < nmdnew.life & nmdnew.life < 5.694E-13 + reso1 &...
    1.447E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.447E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.9;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%5
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    3.235E-13 - reso1 < nmdnew.life & nmdnew.life < 6.3E-13 + reso1 &...
    1.541E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.553E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*0.75;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%6
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    3.258E-13 - reso1 < nmdnew.life & nmdnew.life < 3.27E-13 + reso1 &...
    1.787E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.787E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.15;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%7
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    2.342E-13 - reso1 < nmdnew.life & nmdnew.life < 2.742E-13 + reso1 &...
    1.812E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.841E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.35;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%8
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    2.053E-13 - reso1 < nmdnew.life & nmdnew.life < 2.3E-13 + reso1 &...
    1.871E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.9E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.5;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%9
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    1.6E-13 - reso1 < nmdnew.life & nmdnew.life < 2.3E-13 + reso1 &...
    1.92E13 - reso2 < nmdnew.freq & nmdnew.freq < 2.0E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.5;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 
%10
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    1.5E-13 - reso1 < nmdnew.life & nmdnew.life < 1.957E-13 + reso1 &...
    2.022E13 - reso2 < nmdnew.freq & nmdnew.freq < 2.277E13 + reso2 ...
    );
nmdnew.life(I) = nmdnew.life(I)*1.4;

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )
%--------------------------------------------------------------------------
pause
%-------------------------------------------------------------------------- 




%interpolate

%hori
str_hori = ['/home/jason/Documents/sed/hori/ald_taud_' sys_size '_c15.txt'];
A = load(str_hori); B = sortrows(A);
[X,I,J] = unique(B(:,1),'rows');
C(:,1) = B(I,1); C(:,2) = B(I,2); 
hori.freq = C(:,1); hori.life = C(:,2);

loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    hori.freq,hori.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )

%8
reso1 = 0.01E-13; reso2 = 0.01E13;
[I,J] = find(...
    0 - reso1 < nmdnew.life & nmdnew.life < 7.773E-13 + reso1 &...
    2.4E13 - reso2 < nmdnew.freq & nmdnew.freq < 1.30E14 + reso2 ...
    );

%interpolate
yi = interp1(...
    hori.freq,...
    hori.life,...
    nmdnew.freq(I),'cubic');
nmdnew.life(I) = yi*0.9;

%plot interpolate results
loglog(...
    aldsed.freq/sqrt(nmd.x0.vm),...
    (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
    (1./alloy.life(:,1)) )),'.',...
    nmdnew.freq,nmdnew.life,'.',...
    nmdnew.freq,1E15*nmdnew.freq.^(-2),...
    nmdnew.freq,1E41*nmdnew.freq.^(-4),...
    nmdnew.freq,2*pi./nmdnew.freq...
    )


%conductivity
cond_nmdnew =...
    m_ald_cond(nmdnew.life,nmdnew.vel(:,1),nmd.x0.VOLUME*constant.ang2m^3)
% %plot final
% loglog(...
%     aldsed.freq,...
%     (1./( (1./(aldsed.life/sqrt(nmd.x0.vm))) +...
%     (1./alloy.life(:,1)) )),'.',...
%     nmdnew.freq,nmdnew.life,'.'...
%     )


save([str_nmd 'SEDdata.mat'], '-struct', 'nmdnew');

