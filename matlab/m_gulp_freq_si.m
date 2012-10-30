function freq =...
    m_gulp_freq_si(kpt,NUM_ATOMS_UCELL,MASS,str_main,str_matlab,name)
%--------------------------------------------------------------------------
%freq = gulp_lj_freq( kpt , NUM_ATOMS_UCELL );
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%This is required to get the kpt + dk to properly input to GULP
    format long
%--------------------------------------------------------------------------

constant = m_constant;
si = m_si;

orig(1).str = 'KPT';
change(1).str =...
    strcat( num2str(kpt(1)),'\t',num2str(kpt(2)),'\t',num2str(kpt(3)) );
orig(2).str = 'runpath';
change(2).str = str_main;
orig(3).str = 'MASS';
change(3).str = num2str(MASS);


m_change_file_strings(...
    [str_matlab name],...
    orig,...
    [str_main 'disp.gin'],...
    change);

str.cmd = ['gulp ' str_main 'disp ' str_main 'disp']; system(str.cmd);

% %grep out frequencies
%      str.cmd = ['grep "Frequency  " ' str_main 'disp.gout > '...
%          str_main 'freq_grep.dat'];            
%      system(str.cmd);
%      str.cmd = ['sed "s/Frequency  //g" ' str_main 'freq_grep.dat > '...
%          str_main 'freq_grep2.dat'];            
%      system(str.cmd);
%read in freq to sort properly		
    str.read= [str_main 'freq.gout'];
    fid=fopen(str.read);
    dummy = textscan(fid,'%f','Delimiter','\t','commentStyle', '--'); 
    fclose(fid);
    
freq(1:3*NUM_ATOMS_UCELL) =...
    dummy{1}(:)*constant.c*2*pi;

system(['rm ' str_main 'freq.gout']); 

end