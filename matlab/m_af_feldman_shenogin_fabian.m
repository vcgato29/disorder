clear
con = m_constant;

Di.feldman1993 =...
    load('/home/jason/disorder/si/amor/feldman/feldman_a-si_1993_fig2_a.txt');
Di.feldman1993(:,1) = Di.feldman1993(:,1)*con.eV2J/con.hbar/1000; %meV to eV

Di.feldman1999 =...
    load('/home/jason/disorder/si/amor/feldman/feldman_a-si_1999_fig12.txt');
Di.feldman1999(:,1) = Di.feldman1999(:,1)*con.eV2J/con.hbar/1000;

Di.allen1999a =...
    load('/home/jason/disorder/si/amor/feldman/allen_a-si_1999_fig7_a.txt');
Di.allen1999a(:,1) = Di.allen1999a(:,1)*con.eV2J/con.hbar/1000;

Di.allen1999b =...
    load('/home/jason/disorder/si/amor/feldman/allen_a-si_1999_fig7_b.txt');
Di.allen1999b(:,1) = Di.allen1999b(:,1)*con.eV2J/con.hbar/1000;

Di.shenogin =...
    load('/home/jason/disorder/si/amor/shenogin/shenogin_a-si.txt');
Di.shenogin(:,1) = Di.shenogin(:,1)*1E12*2*pi;
Di.shenogin(:,2) = Di.shenogin(:,2)*100; %cm^2/s to mm^2/s

plot(...
    Di.shenogin(:,1),Di.shenogin(:,2),...
    Di.feldman1993(:,1),Di.feldman1993(:,2),'.',...
    Di.feldman1999(:,1),Di.feldman1999(:,2),'.',...
    Di.allen1999a(:,1),Di.allen1999a(:,2),'.',...
    Di.allen1999b(:,1),Di.allen1999b(:,2),'.',...
    linspace(min(Di.feldman1993(:,1)),max(Di.feldman1993(:,1)),100),...
    3E26*linspace(min(Di.feldman1993(:,1)),max(Di.feldman1993(:,1)),100).^(-2)...
    )

loglog(...
    Di.feldman1993(:,1),Di.feldman1993(:,2),'.',...
    Di.feldman1999(:,1),Di.feldman1999(:,2),'.',...
    Di.allen1999a(:,1),Di.allen1999a(:,2),'.',...
    Di.allen1999b(:,1),Di.allen1999b(:,2),'.',...
    linspace(min(Di.feldman1993(:,1)),max(Di.feldman1993(:,1)),100),...
    linspace(min(Di.feldman1993(:,1)),max(Di.feldman1993(:,1)),100).^(-2)...
    )
    
    
    
    
    