clear
con = m_constant; si = m_si;

%si
DSF(1).DSF =...
    load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/DSF_FIT_b10.mat');
DSF(2).DSF =...
    load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/dsf/nmd/DSF_FIT.mat');

SED(1).SED =...
    load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/SEDfit_fixed.mat');
SED(2).SED =...
    load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/SEDfit_fixed.mat');

gk = m_si_cond_amor_gk_results;

Di(8,1).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b5.gout');
Di(8,1).Di(:,3) = Di(8,1).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,1) = (con.kb / VOLUME)*sum(Di(8,1).Di(:,3));
% [Di(8,1).dosx Di(8,1).dosy] = m_dos(Di(8,1).Di(:,2), 100 , 1, VOLUME);

Di(8,5).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b25.gout');
Di(8,5).Di(:,3) = Di(8,5).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,5) = (con.kb / VOLUME)*sum(Di(8,5).Di(:,3));
[Di(8,5).dosx Di(8,5).dosy] = m_dos(Di(8,5).Di(:,2), 30 , 1, VOLUME);

Di(8,10).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b75.gout');
Di(8,10).Di(:,3) = Di(8,10).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,10) = (con.kb / VOLUME)*sum(Di(8,10).Di(:,3));
[Di(8,10).dosx Di(8,10).dosy] = m_dos(Di(8,10).Di(:,2), 150 , 1, VOLUME);

Di(8,11).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b100.gout');
Di(8,11).Di(:,3) = Di(8,11).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,11) = (con.kb / VOLUME)*sum(Di(8,11).Di(:,3));

Di(8,12).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b200.gout');
Di(8,12).Di(:,3) = Di(8,12).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,12) = (con.kb / VOLUME)*sum(Di(8,12).Di(:,3));

Di(8,13).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b300.gout');
Di(8,13).Di(:,3) = Di(8,13).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,13) = (con.kb / VOLUME)*sum(Di(8,13).Di(:,3));

Di(8,14).Di =...
    m_gulp_af_si_readDi(...
    '/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/','Di_b400.gout');
Di(8,14).Di(:,3) = Di(8,14).Di(:,3)*(3/4)/10;
VOLUME = (8*5.43E-10)^3;
cond(8,14) = (con.kb / VOLUME)*sum(Di(8,14).Di(:,3));

%--------------------------------------------------------------------------
%sio2
%--------------------------------------------------------------------------

siO2 = m_sio2

sio2.D(1,1).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a972/emin/','Di_b1.gout');
sio2.D(1,1).D(:,3) = sio2.D(1,1).D(:,3)*(3/4)/10;
sio2.VOLUME = (24.5E-10)^3;
sio2.cond(1) = (con.kb / sio2.VOLUME)*sum(sio2.D(1,1).D(:,3));
[sio2.D(1,1).dosx sio2.D(1,1).dosy] = m_dos(sio2.D(1,1).D(:,2), 100 , 1, sio2.VOLUME);
sio2.D(2,1).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a972/emin/','Di_b2.gout');
sio2.D(2,1).D(:,3) = sio2.D(2,1).D(:,3)*(3/4)/10;
sio2.cond(2,1) = (con.kb / sio2.VOLUME)*sum(sio2.D(2,1).D(:,3));
sio2.D(3,1).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a972/emin/','Di_b3.gout');
sio2.D(3,1).D(:,3) = sio2.D(3,1).D(:,3)*(3/4)/10;
sio2.cond(3,1) = (con.kb / sio2.VOLUME)*sum(sio2.D(3,1).D(:,3));
sio2.D(4,1).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a972/emin/','Di_b4.gout');
sio2.D(4,1).D(:,3) = sio2.D(4,1).D(:,3)*(3/4)/10;
sio2.cond(4,1) = (con.kb / sio2.VOLUME)*sum(sio2.D(4,1).D(:,3));
sio2.D(5,1).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a972/emin/','Di_b5.gout');
sio2.D(5,1).D(:,3) = sio2.D(5,1).D(:,3)*(3/4)/10;
sio2.cond(5,1) = (con.kb / sio2.VOLUME)*sum(sio2.D(5,1).D(:,3));

loglog(...
sio2.D(1,1).D(:,2),sio2.D(1,1).D(:,3),'.',...
sio2.D(5,1).D(:,2),sio2.D(5,1).D(:,3),'.'...
)

%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(1,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b10.gout');
sio2.D(1,2).D(:,3) = sio2.D(1,2).D(:,3)*(3/4)/10;
sio2.cond(1,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(1,2).D(:,3));
[sio2.D(1,2).dosx sio2.D(1,2).dosy] = m_dos(sio2.D(1,2).D(:,2), 70 , 1, sio2.VOLUME(1,2));

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(2,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b12.gout');
sio2.D(2,2).D(:,3) = sio2.D(2,2).D(:,3)*(3/4)/10;
sio2.cond(2,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(2,2).D(:,3));
[sio2.D(2,2).dosx sio2.D(2,2).dosy] = m_dos(sio2.D(2,2).D(:,2), 70 , 1, sio2.VOLUME(1,2));

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(3,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b14.gout');
sio2.D(3,2).D(:,3) = sio2.D(3,2).D(:,3)*(3/4)/10;
sio2.cond(3,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(3,2).D(:,3));
[sio2.D(3,2).dosx sio2.D(3,2).dosy] = m_dos(sio2.D(3,2).D(:,2), 70 , 1, sio2.VOLUME(1,2));

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(4,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b16.gout');
sio2.D(4,2).D(:,3) = sio2.D(4,2).D(:,3)*(3/4)/10;
sio2.cond(4,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(4,2).D(:,3));
[sio2.D(4,2).dosx sio2.D(4,2).dosy] = m_dos(sio2.D(4,2).D(:,2), 70 , 1, sio2.VOLUME(1,2));

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(5,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b18.gout');
sio2.D(5,2).D(:,3) = sio2.D(5,2).D(:,3)*(3/4)/10;
sio2.cond(5,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(5,2).D(:,3));
[sio2.D(5,2).dosx sio2.D(5,2).dosy] = m_dos(sio2.D(5,2).D(:,2), 70 , 1, sio2.VOLUME(1,2));

sio2.VOLUME(1,2) = (31.9400E-10)^3;
sio2.D(6,2).D = m_gulp_af_si_readDi('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/','Di_b20.gout');
sio2.D(6,2).D(:,3) = sio2.D(6,2).D(:,3)*(3/4)/10;
sio2.cond(6,2) = (con.kb / sio2.VOLUME(1,2))*sum(sio2.D(6,2).D(:,3));
[sio2.D(6,2).dosx sio2.D(6,2).dosy] = m_dos(sio2.D(6,2).D(:,2), 700 , 1, sio2.VOLUME(1,2));

% sio2.SED(1).SED =...
%     load('/home/jason/disorder2/sio2/alan/a288/tile/emin/SEDfit_inv1.mat');
sio2.SED(2).SED =...
    load('/home/jason/disorder2/sio2/alan/a288/tile/emin/SEDfit_inv2.mat');
sio2.SED(4).SED =...
    load('/home/jason/disorder2/sio2/alan/a288/tile/emin/SEDfit_inv4.mat');

sio2.SED(1,2).SED =...
    load('/home/jason/disorder2/sio2/alan/a972/emin/SEDfit.mat');

sio2.SED(1).SED =...
    load('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/SEDfit.mat');

sio2.SED(1).SED.life(4:7) = sio2.SED(1).SED.life(4:7)*1.5;

clf
loglog(...
    sio2.SED(1).SED.HLDfreq(4:end),sio2.SED(1).SED.life(4:end)*1e-12,'.'...
    )
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf
loglog(...
    sio2.SED(1).SED.HLDfreq(4:end),(1/3)*(siO2.vs_tran*0.75)^2*sio2.SED(1).SED.life(4:end)*1e-12,'.',...
    sio2.D(6,2).D(:,2),sio2.D(6,2).D(:,3),'.'...
    )
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------

sio2.gk = m_sio2_cond_amor_gk_results;

%--------------------------------------------------------------------------
%conductivity
%--------------------------------------------------------------------------
errorbar(...
    1./sio2.gk.size , sio2.gk.cond(:,1) , sio2.gk.cond(:,2)...
    )
hold on
errorbar(...
    1./gk.size , gk.cond(:,1) , gk.cond(:,2)...
    )
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf

%--------------------------------------------------------------------------
%debye
%--------------------------------------------------------------------------

% k = \int_{0}^{w_{max}} \frac{d\omega DOS(\omega)C(\omega/T)D(\omega)}{V}
% units: W/m-K = [ rads/s ] [ () ] [ J/K ] [ m^2/s ][ 1/m^3 ]
% units: DOS = [ 1 / rads/s ]

debye.num = 500;
debye.A=1E-29;
debye.B=1.3E21;
debye.c = 0.95*si.amor.vs_tran;
debye.wmin = min(Di(8,1).Di(:,2)); %4.113E12
debye.wcut = 1.1625E13; 
debye.dw = debye.wcut/debye.num;
debye.freq_range = linspace(debye.wcut/debye.num,debye.wcut,debye.num);
debye.dos = 3*(debye.freq_range.^2)/(2*(0.93*si.amor.vs_tran)^3*pi^2)*VOLUME;
debye.cond = (con.kb/VOLUME)*(debye.dos*debye.dw)*debye.B.*(debye.freq_range.^(-2));
debye.mfp = 3*debye.B.*(debye.freq_range.^(-2))/(0.93*si.amor.vs_tran);

film_thick_500 = 500*1E-9; film_thick_2000 = 2000*1E-9;
debye.mfp_film_500 = 1./( 1./debye.mfp + 1./film_thick_500 );
debye.cond_film_500 = (debye.mfp_film_500./debye.mfp).*debye.cond;
debye.mfp_film_2000 = 1./( 1./debye.mfp + 1./film_thick_2000 );
debye.cond_film_2000 = (debye.mfp_film_2000./debye.mfp).*debye.cond;
[Y debye.Isort] = sort(debye.mfp);
sum(debye.cond)
sum(debye.cond_film_500)
sum(debye.cond_film_2000)

%--------------------------------------------------------------------------
%debye sio2
%--------------------------------------------------------------------------

sio2.debye.num = 100;
sio2.debye.A=1E-29;
sio2.debye.B=2.3*0.4E20;
sio2.debye.c = (1/3)*siO2.vs_long + (2/3)*siO2.vs_tran;
sio2.debye.wmin = min(sio2.D(1,2).D(:,2)); %4.113E12
sio2.debye.wcut = 4.0E12; 
sio2.debye.dw = sio2.debye.wcut/sio2.debye.num;
sio2.debye.freq_range = linspace(sio2.debye.wcut/sio2.debye.num,sio2.debye.wcut,sio2.debye.num);
sio2.debye.dos = 3*(sio2.debye.freq_range.^2)/(2*(0.74*siO2.vs_tran)^3*pi^2)*sio2.VOLUME(1,2);
sio2.debye.cond = (con.kb/sio2.VOLUME(1,2))*(sio2.debye.dos*sio2.debye.dw)*sio2.debye.B.*(sio2.debye.freq_range.^(-2));
sio2.debye.mfp = 3*sio2.debye.B.*(sio2.debye.freq_range.^(-2))/siO2.vs_tran;
[Y sio2.debye.Isort] = sort(sio2.debye.mfp);
sum(sio2.debye.cond)

sio2.debye.mfp_film_500 = 1./( 1./sio2.debye.mfp + 1./film_thick_500 );
sio2.debye.cond_film_500 = (sio2.debye.mfp_film_500./sio2.debye.mfp).*sio2.debye.cond;
[Y sio2.debye.Isort] = sort(sio2.debye.mfp);
sum(sio2.debye.cond)
sum(sio2.debye.cond_film_500)

%--------------------------------------------------------------------------
T = 300;
%--------------------------------------------------------------------------

%matth
matth.T0 = 20; matth.dres = 1.7E-4; matth.drel = 2.5E-4;
matth.Dres = 1./(   (1/matth.dres) * (con.hbar*Di(8,1).Di(:,2) / (con.kb * matth.T0) ) .*...
    tanh( con.hbar*Di(8,1).Di(:,2) / (2 * con.kb * T) )   );
matth.Drel = 1./(   (1/matth.drel) * ( (T/matth.T0)^3 ) ./...
    ( 1 + (con.kb*matth.T0 ./ (con.hbar * Di(8,1).Di(:,2) )) * ( (T/matth.T0)^3 ) )   ); 

% %subplot(2,1,1),...
% loglog(...
%     Di(8,1).Di(:,2),matth.Dres,...
%     Di(8,1).Di(:,2),matth.Drel,...
%     Di(8,1).Di(:,2),Di(8,1).Di(:,3),...
%     SED.HLDfreq,((1/3))*debye.c^2*(SED.life*1E-12),...
%     DSF(1).DSF.freq(1:8)*1E12,((1/3))*si.amor.vs_long^2*(DSF(1).DSF.life(1:8)*1E-12),...
%     DSF(1).DSF.freq(9:16)*1E12,((1/3))*si.amor.vs_tran^2*(DSF(1).DSF.life(9:16)*1E-12),...
%     linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
%     debye.B*linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100).^(-2),...
%     linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
%     1E12*2*pi./linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
%     linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
%     (1/3)*debye.c*(5.43E-10/2)*ones(1,100)...
%     )
% %axis([ 3E12 4E14 1.0E-8 6.0E-5 ])
% %--------------------------------------------------------------------------
% pause
% %--------------------------------------------------------------------------


%sed
si.SF_tran=load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/DSF_tran_b10.mat');
si.SF_long=load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/DSF_long_b10.mat');
si.DSF_long = load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/dsf/nmd/DSF.mat');
si.SEDavg = load('/home/jason/disorder2/si/amor/normand/perf4096/anneal_1100K/emin/SEDavg.mat');

sio2.SF_tran=load('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/DSF_tran_b20_16.mat');
sio2.SF_long=load('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/DSF_long_b20_16.mat');

sio2.DSF_life =...
    load('/home/jason/disorder2/sio2/alan/a288/tile/anneal/emin/DSF_FIT.mat');

% for ikpt =1:8
% semilogy(...
%     SF_long.freq_range/1e12,SF_long.SL(:,ikpt),...
%     DSF_long.freq_range,smooth(DSF_long.SL(:,ikpt),7)...
%     )
% pause
% end
semilogy(...
    si.SF_long.freq_range(100:700)/1e12,si.SF_long.SL(100:700,1),...
    si.DSF_long.freq_range(50:300),1E2*smooth(si.DSF_long.SL(50:300,1),7),...
    si.SEDavg.omega,1.5E-13*smooth(si.SEDavg.sed(:,10),7),...
    si.SF_long.freq_range(100:end)/1e12,si.SF_long.SL(100:end,2),...
    si.DSF_long.freq_range(50:end),3.5E2*smooth(si.DSF_long.SL(50:end,2),7),...
    si.SEDavg.omega,8E-13*smooth(si.SEDavg.sed(:,96),7)...
    )
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf
subplot(3,1,1),...
semilogx(...
    si.SF_long.SL(:,1),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,2),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,3),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,4),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,5),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,6),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,7),si.SF_long.freq_range(:),...
    si.SF_long.SL(:,8),si.SF_long.freq_range(:)...
    )
subplot(3,1,2),...
semilogx(...
    si.SF_tran.SL(:,1),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,2),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,3),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,4),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,5),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,6),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,7),si.SF_tran.freq_range(:),...
    si.SF_tran.SL(:,8),si.SF_tran.freq_range(:)...
    )
subplot(3,1,3),...
    errorbar(...
    [0 ; si.SF_tran.kpt(:,1)],...
    [0 DSF(1).DSF.freq(1:8)*1E12]',...
    [0 1./(2*DSF(1).DSF.life(1:8)*1E-12)]'...
    )
hold on
errorbar(...
    [0 ; si.SF_tran.kpt(:,1)],...
    [0 DSF(1).DSF.freq(9:16)*1E12]',...
    [0 1./(2*DSF(1).DSF.life(9:16)*1E-12)]'...
    )


si.SF_long.vs(1) = ( 1.164E13 ) / ((1/8)/(5.43E-10))/(2*pi)
si.SF_long.vs(2) = ( 2.347E13 - 1.164E13 ) / ((1/8)/(5.43E-10))/(2*pi)

si.SF_tran.vs(1) = ( 5.351E12 ) / ((1/8)/(5.43E-10))/(2*pi)
si.SF_tran.vs(2) = ( 1.047E13 - 5.351E12 ) / ((1/8)/(5.43E-10))/(2*pi)

%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf
subplot(3,1,1),...
semilogx(...
    sio2.SF_long.SL(:,1),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,2),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,3),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,4),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,5),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,6),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,7),sio2.SF_long.freq_range(:),...
    sio2.SF_long.SL(:,8),sio2.SF_long.freq_range(:)...
    )
subplot(3,1,2),...
semilogx(...
    sio2.SF_tran.SL(:,1),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,2),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,3),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,4),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,5),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,6),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,7),sio2.SF_tran.freq_range(:),...
    sio2.SF_tran.SL(:,8),sio2.SF_tran.freq_range(:)...
    )
subplot(3,1,3),...
errorbar(...
    2*(16/13)*[0 ; sio2.SF_tran.kpt(:,1) ],...
    1E12*[0 sio2.DSF_life.freq(1:8)],...
    1./([0 2*sio2.DSF_life.life(1:8)])*1E12...
    )
hold on
errorbar(...
    2*(16/13)*[0 ; sio2.SF_tran.kpt(:,1) ],...
    1E12*[0 sio2.DSF_life.freq(9:16)],...
    1./([0 2*sio2.DSF_life.life(9:16)])*1E12...
    )
    

sio2.SF_long.vs(1) = ( sio2.DSF_life.freq(1)*1E12 ) / ((1/13)/(2.4183E-10))/(2*pi)
%sio2.SF_long.vs(2) = ( 2.512E13 - 7.301E12 ) / ((1/16)/(2.4183E-10))/(2*pi)

sio2.SF_tran.vs(1) = ( sio2.DSF_life.freq(9)*1E12 ) / ((1/13)/(2.4183E-10))/(2*pi)
%sio2.SF_tran.vs(2) = ( 0.9841E13 - 5.476E12 ) / ((1/16)/(2.4183E-10))/(2*pi)
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
clf

%DOS
%subplot(3,1,3),...
loglog(...
    sio2.D(5,2).dosx,sio2.D(5,2).dosy,...
    sio2.D(6,2).dosx,sio2.D(6,2).dosy,...
    Di(8,5).dosx,Di(8,5).dosy,...
    Di(8,10).dosx,Di(8,10).dosy,...
    sio2.debye.freq_range,sio2.debye.dos,...
    debye.freq_range,debye.dos...
    )
axis([ 1E12 4E14 2E-12 3E-10])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%tau
%--------------------------------------------------------------------------

SED(1).SED.life(5:6) = SED(1).SED.life(5:6)*1.75; 

clf
subplot(2,1,2),...
loglog(...
    SED(1).SED.HLDfreq,(SED(1).SED.life*1E-12),'.',...
    DSF(1).DSF.freq(1:8)*1E12,(DSF(1).DSF.life(1:8)*1E-12),...
    DSF(1).DSF.freq(9:16)*1E12,(DSF(1).DSF.life(9:16)*1E-12),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    4E14*linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100).^(-2),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    2*pi./linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100)...
    )
axis([ 1E12 4.0E14 1E-14 2E-11])
subplot(2,1,1),...
loglog(...
    sio2.SED(1).SED.HLDfreq(4:end),sio2.SED(1).SED.life(4:end)*1e-12,'.',...
    sio2.DSF_life.freq(1:4)*1E12,sio2.DSF_life.life(1:4)*1E-12,...
    sio2.DSF_life.freq(9:12)*1E12,sio2.DSF_life.life(9:12)*1E-12,...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    4E14*linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100).^(-2),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    2*pi./linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100)...
    )
axis([ 1E12 4.0E14 1E-14 2E-11])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------

%Di

subplot(2,1,1),...
loglog(...
    SED(1).SED.HLDfreq,((1/3))*si.amor.vs_tran^2*(1.0*SED(1).SED.life*1E-12),'.',...
    Di(8,1).Di(:,2),Di(8,1).Di(:,3),'.',...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (1/3)*(5.43E-10/2)*si.amor.vs_tran*ones(100,1),...
    linspace(min(Di(8,10).Di(:,2)), debye.wcut ,100),...
    debye.B*linspace(min(Di(8,10).Di(:,2)), debye.wcut ,100).^(-2)...
    )
axis([ 1E12 4.0E14 1E-7 1E-4])
subplot(2,1,2),...
loglog(...
    sio2.SED(1).SED.HLDfreq(4:end),((1/3))*siO2.vs_tran^2*(sio2.SED(1).SED.life(4:end)*1e-12),'.',...
    sio2.D(3,2).D(:,2),sio2.D(3,2).D(:,3),'.',...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (1/3)*(4.8E-10)*siO2.vs_tran*ones(100,1),...
    linspace( 1E12 , sio2.debye.wcut ,100),...
    0.75*sio2.debye.B*linspace( 1E12 , sio2.debye.wcut ,100).^(-2)...
    )
axis([ 1E12 4.0E14 1E-7 1E-4])

%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------


% %SED/AF
% %subplot(2,1,1),...
% loglog(...
%     Di(8,1).Di(:,2),sqrt(3*Di(8,1).Di(:,3)'./(SED.life(5:end)*1E-12)),...
%     linspace(min(Di(8,1).Di(:,2)),max(Di(8,1).Di(:,2)),100),...
%     si.amor.vs_tran*ones(1,100)...
%     )
% %subplot(3,1,2),...
% loglog(...
%     Di(8,1).Di(:,2),Di(8,1).Di(:,3)./(1.0*((1/3))*si.amor.vs_tran^2*(SED.life(5:end)'*1E-12))...
%     )
% %--------------------------------------------------------------------------
% %pause
% %--------------------------------------------------------------------------

%mfp
subplot(2,1,1),...
    loglog(...
    SED(1).SED.HLDfreq(5:end),si.amor.vs_tran*(SED(1).SED.life(5:end)*1E-12),...
    Di(8,1).Di(:,2),sqrt(3*Di(8,1).Di(:,3).*(SED(1).SED.life(5:end)'*1E-12)),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (8*5.43E-10)*ones(100,1),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (5.43E-10/2)*ones(100,1)...
    )
axis([ 3E12 1.3E14 1E-10 1E-7])
subplot(2,1,2),...
    loglog(...
    sio2.SED(1).SED.HLDfreq(4:end),siO2.vs_tran*(sio2.SED(1).SED.life(4:end)*1e-12),...
    sio2.D(6,2).D(:,2),sqrt(3*sio2.D(6,2).D(:,3).*(sio2.SED(1).SED.life(4:end)'*1e-12)),...
    linspace(min(sio2.D(6,2).D(:,2)),max(sio2.D(6,2).D(:,2)),100),...
    (31.94E-10)*ones(100,1),...
    linspace(min(sio2.D(6,2).D(:,2)),max(sio2.D(6,2).D(:,2)),100),...
    (4.8E-10)*ones(100,1)...
    )
axis([ 3E12 1.3E14 1E-10 1E-7])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
%vAF
%subplot(3,1,1),...
    loglog(...
    Di(8,1).Di(:,2),3*Di(8,1).Di(:,3)/si.amor.vs_tran,...
    SED(1).SED.HLDfreq,si.amor.vs_tran*(1.0*SED(1).SED.life*1E-12),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (8*5.43E-10)*ones(100,1),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (5.43E-10/2)*ones(100,1)...
    )
axis([ 3E12 1.3E14 1E-10 1E-7])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------

%si
%wcut
[debye.Icut1 debye.Jcut1] = find( Di(8,1).Di(:,2) < debye.wcut + 0.0001E12);
[debye.Icut2 debye.Jcut2] = find( Di(8,1).Di(:,2) > debye.wcut - 0.0001E12);
[SED(1).Icut1 SED(1).Jcut1] = find( SED(1).SED.HLDfreq < 0.0 + 0.0001E12);
[SED(1).Icut2 SED(1).Jcut2] = find( SED(1).SED.HLDfreq > 0.0 - 0.0001E12);
VOLUME = (8*5.43E-10)^3;
debye.cut(1).cond = (con.kb / VOLUME)*Di(8,1).Di(debye.Icut1,3);
debye.cut(2).mfp = sqrt(3*Di(8,1).Di(debye.Icut1,3).*SED(1).SED.life(debye.Icut1+4)'*1E-12 );
%debye.cut(2).mfp = 3*Di(8,1).Di(debye.Icut1,3)/si.amor.vs_tran;
sum(debye.cut(1).cond)
debye.cut(2).cond = (con.kb / VOLUME)*Di(8,1).Di(debye.Icut2,3);
debye.cut(2).mfp = sqrt(3*Di(8,1).Di(debye.Icut2,3).*SED(1).SED.life(debye.Icut2+4)'*1E-12 );
%debye.cut(2).mfp = 3*Di(8,1).Di(debye.Icut2,3)/si.amor.vs_tran;
[Y debye.cut(2).Isort] = sort(debye.cut(2).mfp);
sum(debye.cut(2).cond)
SED(1).cut(1).cond = (con.kb / VOLUME)*((1/3))*si.amor.vs_tran^2*(1.0*SED(1).SED.life(SED(1).Jcut1)*1E-12)';
SED(1).cut(1).mfp = si.amor.vs_tran*SED(1).SED.life(SED(1).Jcut1)*1E-12';
[Y SED(1).cut(1).Isort] = sort(SED(1).cut(1).mfp);
SED(1).SED.cut(2).cond = (con.kb / VOLUME)*((1/3))*si.amor.vs_tran^2*(1.0*SED(1).SED.life(SED(1).Jcut2)*1E-12)';
SED(1).SED.cut(2).mfp = si.amor.vs_tran*SED(1).SED.life(SED(1).Jcut2)*1E-12';
[Y SED(1).SED.cut(2).Isort] = sort(SED(1).SED.cut(2).mfp);
sum(SED(1).SED.cut(1).cond)
sum(SED(1).SED.cut(2).cond)

%sio2
%wcut
[sio2.debye.Icut1 sio2.debye.Jcut1] = find( sio2.D(3,2).D(:,2) < sio2.debye.wcut + 0.0001E12);
[sio2.debye.Icut2 sio2.debye.Jcut2] = find( sio2.D(3,2).D(:,2) > sio2.debye.wcut - 0.0001E12);
[sio2.SED(1).Icut1 sio2.SED(1).Jcut1] = find( sio2.SED(1).SED.HLDfreq < 0.0 + 0.0001E12);
[sio2.SED(1).Icut2 sio2.SED(1).Jcut2] = find( sio2.SED(1).SED.HLDfreq > 0.0 - 0.0001E12);
sio2.VOLUME = (31.94E-10)^3;
sio2.debye.cut(1).cond = (con.kb / sio2.VOLUME)*sio2.D(3,2).D(sio2.debye.Icut1,3);
sio2.debye.cut(2).mfp = sqrt(3*sio2.D(3,2).D(sio2.debye.Icut1,3).*sio2.SED(1).SED.life(sio2.debye.Icut1+3)'*1E-12 );
%debye.cut(2).mfp = 3*Di(8,1).Di(debye.Icut1,3)/si.amor.vs_tran;
sum(sio2.debye.cut(1).cond)
sio2.debye.cut(2).cond = (con.kb / sio2.VOLUME)*sio2.D(3,2).D(sio2.debye.Icut2,3);
sio2.debye.cut(2).mfp = sqrt(3*sio2.D(3,2).D(sio2.debye.Icut2,3).*sio2.SED(1).SED.life(sio2.debye.Icut2+3)'*1E-12 );
%debye.cut(2).mfp = 3*Di(8,1).Di(debye.Icut2,3)/si.amor.vs_tran;
[Y sio2.debye.cut(2).Isort] = sort(sio2.debye.cut(2).mfp);
sum(sio2.debye.cut(2).cond)
% sio2.SED(1).cut(1).cond = (con.kb / sio2.VOLUME)*((1/3))*siO2.vs_tran^2*(1.0*sio2.SED(1).SED.life(sio2.SED(1).Jcut1)*1E-12)';
% sio2.SED(1).cut(1).mfp = siO2.vs_tran*sio2.SED(1).SED.life(sio2.SED(1).Jcut1)*1E-12';
% [Y sio2.SED(1).cut(1).Isort] = sort(sio2.SED(1).cut(1).mfp);
% sio2.SED(1).SED.cut(2).cond = (con.kb / sio2.VOLUME)*((1/3))*siO2.vs_tran^2*(1.0*sio2.SED(1).SED.life(sio2.SED(1).Jcut2)*1E-12)';
% sio2.SED(1).SED.cut(2).mfp = siO2.vs_tran*sio2.SED(1).SED.life(sio2.SED(1).Jcut2)*1E-12';
% [Y sio2.SED(1).SED.cut(2).Isort] = sort(sio2.SED(1).SED.cut(2).mfp);
% sum(sio2.SED(1).SED.cut(1).cond)
% sum(sio2.SED(1).SED.cut(2).cond)

%semilogx(Di(8,1).Di(:,2),cumtrapz((con.kb / VOLUME)*Di(8,1).Di(:,3) ),'.')
%semilogx(flipdim(debye.mfp,2),sum(debye.cond) + sum(SED.cut(1).cond)+cumtrapz(debye.cond))
%semilogx( flipdim(SED.cut(1).mfp'), cumtrapz(SED.cut(1).cond))

%Di
loglog(...
    SED(1).SED.HLDfreq,((1/3))*si.amor.vs_tran^2*(1.0*SED(1).SED.life*1E-12),...
    Di(8,1).Di(debye.Icut2,2),Di(8,1).Di(debye.Icut2,3),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    (1/3)*(5.43E-10/2)*si.amor.vs_tran*ones(100,1),...
    linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100),...
    debye.B*linspace(min(Di(8,10).Di(:,2)),max(Di(8,10).Di(:,2)),100).^(-2)...
    )
axis([ 3E12 1.3E14 1E-8 1E-4])
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------

regner.cond(1).cond = load('/home/jason/disorder/si/amor/regner/500nm.dat');
regner.cond(2).cond = load('/home/jason/disorder/si/amor/regner/1000nm.dat');
regner.cond(3).cond = load('/home/jason/disorder/si/amor/regner/2000nm.dat');



% subplot(2,1,1),...
% semilogx(...
%     debye.cut(2).mfp(debye.cut(2).Isort) , cumtrapz(debye.cut(2).cond(debye.cut(2).Isort)),...   %SED(1).cut(1).mfp(SED(1).cut(1).Isort) , sum(debye.cut(2).cond) + cumtrapz(SED(1).cut(1).cond(SED(1).cut(1).Isort)),...
%     debye.mfp(debye.Isort) , sum(debye.cut(2).cond) + sum(SED(1).cut(1).cond)+cumtrapz(debye.cond(debye.Isort)),...
%     (8*5.43E-10)*ones(1,100) , linspace(0,2,100),...
%     ((5.43/2)*1E-10)*ones(1,100) , linspace(0,2,100)...
%     )
% subplot(2,1,2),...
semilogx(...
    sio2.debye.cut(2).mfp(sio2.debye.cut(2).Isort) , cumtrapz(sio2.debye.cut(2).cond(sio2.debye.cut(2).Isort)),...
    sio2.debye.mfp_film_500(sio2.debye.Isort) , sum(sio2.debye.cut(2).cond) + cumtrapz(sio2.debye.cond_film_500(sio2.debye.Isort)),...
    debye.cut(2).mfp(debye.cut(2).Isort) , cumtrapz(debye.cut(2).cond(debye.cut(2).Isort)),...   %SED(1).cut(1).mfp(SED(1).cut(1).Isort) , sum(debye.cut(2).cond) + cumtrapz(SED(1).cut(1).cond(SED(1).cut(1).Isort)),...
    debye.mfp_film_500(debye.Isort) , sum(debye.cut(2).cond) + sum(SED(1).cut(1).cond)+cumtrapz(debye.cond_film_500(debye.Isort)),...
    debye.mfp(debye.Isort) , sum(debye.cut(2).cond) + sum(SED(1).cut(1).cond)+cumtrapz(debye.cond(debye.Isort)),... %(8*5.43E-10)*ones(1,100) , linspace(0,2,100),... ((5.43/2)*1E-10)*ones(1,100) , linspace(0,2,100),...
    regner.cond(1).cond(:,1)*1e-6 , regner.cond(1).cond(:,2)*1.7,...
    regner.cond(2).cond(:,1)*1e-6 , regner.cond(2).cond(:,2)*1.7,...
    regner.cond(3).cond(:,1)*1e-6 , regner.cond(3).cond(:,2)*1.7... 
    )
%--------------------------------------------------------------------------
pause
%--------------------------------------------------------------------------
