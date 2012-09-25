
%compare all systems biggest size

%af
str.af = '/home/jason/disorder/lj/alloy/10K/0.0/10x/work';
af(1).di=load(strcat(str.af,'/Di(wi)_1.dat'));
str.af = '/home/jason/disorder/lj/alloy/10K/0.05/10x/work';
af(2).di=load(strcat(str.af,'/Di(wi)_1.dat'));
str.af = '/home/jason/disorder/lj/alloy/10K/0.15/10x/work';
af(3).di=load(strcat(str.af,'/Di(wi)_1.dat'));
str.af = '/home/jason/disorder/lj/alloy/10K/0.5/10x/work';
af(4).di=load(strcat(str.af,'/Di(wi)_1.dat'));
str.af = '/home/jason/disorder/lj/amor/10x/work';
af(5).di=load(strcat(str.af,'/Di(wi)_1.dat'));
str.af = '/home/jason/disorder/lj/amor/rect/24x6x6/work';
af(6).di=load(strcat(str.af,'/Di(wi)_1.dat'));
af(6).freq=load(strcat(str.af,'/freq_1.dat'));

loglog(...
    af(1).di(:,1),af(1).di(:,2),'.',...
    af(2).di(:,1),af(2).di(:,2),'.',...
    af(3).di(:,1),af(3).di(:,2),'.',...
    af(4).di(:,1),af(4).di(:,2),'.',...
    af(5).di(:,1),af(5).di(:,2),'.',...
    af(6).freq,af(6).di(:,1),'.',...
    af(6).freq,af(6).di(:,2),'.',...
    af(6).freq,af(6).di(:,3),'.'...
    )

%nmd
str.nmd = '/home/jason/disorder/lj/alloy/10K/0.0/10x/NMD/1/work';
nmd(1).sed=load(strcat(str.nmd,'/SEDdata.mat'));
nmd(1).nmd=load(strcat(str.nmd,'/NMDdata.mat'));
nmd(1).sed = nmd_convert_data(nmd(1).nmd,nmd(1).sed);
str.nmd = '/home/jason/disorder/lj/alloy/10K/0.05/10x/NMD/1/work';
nmd(2).sed=load(strcat(str.nmd,'/SEDdata.mat'));
nmd(2).nmd=load(strcat(str.nmd,'/NMDdata.mat'));
nmd(2).sed = nmd_convert_data(nmd(2).nmd,nmd(2).sed);
str.nmd = '/home/jason/disorder/lj/alloy/10K/0.15/10x/NMD/1/work';
nmd(3).sed=load(strcat(str.nmd,'/SEDdata.mat'));
nmd(3).nmd=load(strcat(str.nmd,'/NMDdata.mat'));
nmd(3).sed = nmd_convert_data(nmd(3).nmd,nmd(3).sed);
str.nmd = '/home/jason/disorder/lj/alloy/10K/0.5/10x/NMD/1/work';
nmd(4).sed=load(strcat(str.nmd,'/SEDdata.mat'));
nmd(4).nmd=load(strcat(str.nmd,'/NMDdata.mat'));
nmd(4).sed = nmd_convert_data(nmd(4).nmd,nmd(4).sed);

%0.0
loglog(...
    nmd(1).sed.freq,nmd(1).sed.diff(:,1),'.',...
    af(1).di(:,1),af(1).di(:,2),'.'...
    )

pause

%0.05
loglog(...
    nmd(2).sed.freq,nmd(2).sed.diff(:,1),'.',...
    af(2).di(:,1),af(2).di(:,2),'.'...
    )

pause

%0.15
loglog(...
    nmd(3).sed.freq,nmd(3).sed.diff(:,1),'.',...
    af(3).di(:,1),af(3).di(:,2),'.'...
    )

pause

%0.5
loglog(...
    nmd(4).sed.freq,nmd(4).sed.diff(:,1),'.',...
    af(4).di(:,1),af(4).di(:,2),'.'...
    )

pause




%compare predicted conductivities

af(1).size =[4;6;8;10;12 ];
af(1).cond =[0.0;0.0;79.66;137.29;217.34];

af(2).size =[4;6;8;10;12 ];
af(2).cond =[1.2759;0.0;1.746;1.7814;2.0066];

af(3).size =[4;6;8;10;12 ];
af(3).cond =[0.46701;0.0;0.7009;0.70392;0.80386];

af(4).size =[4;6;8;10;12 ];
af(4).cond =[0.24117;0.0;0.33957;0.34992;0.39141];

af(5).size =[4;6;8;10;12;24 ];
af(5).cond =[0.12999;0.0;0.13989;0.14576;0.13733;0.1398];

plot(...
    af(2).size,af(2).cond/max(af(2).cond),'.',...
    af(3).size,af(3).cond/max(af(3).cond),'.',...
    af(4).size,af(4).cond/max(af(4).cond),'.',...
    af(5).size,af(5).cond/max(af(5).cond),'.'...
    )
