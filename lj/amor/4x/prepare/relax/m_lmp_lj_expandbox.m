
%-------------------------------------------------------------------------- 

format long

str.main = '/home/jason/disorder/lj/amor/4x/prepare/relax/';

dummy = dlmread(strcat(str.main,'x0_2.data'));

iseed=1;

    LD.param = dummy(1,:);
    LD.id = dummy(2:size(dummy,1),1);
    LD.m = dummy(2:size(dummy,1),2);
    LD.x = dummy(2:size(dummy,1),3);
    LD.y = dummy(2:size(dummy,1),4);
    LD.z = dummy(2:size(dummy,1),5);
    LD.pos(:,1) = LD.id; LD.pos(:,2) = LD.m; 
    LD.pos(:,3) = LD.x; LD.pos(:,4) = LD.y; LD.pos(:,5) = LD.z;
    
    LD.NUM_ATOMS_UCELL = LD.param(2); LD.NUM_ATOMS = LD.param(1);
    LD.NUM_MODES = LD.param(2)*3;
    
    LD.Lx = LD.param(3); LD.Ly = LD.param(4); LD.Lz = LD.param(5);
    LD.VOLUME = LD.Lx*LD.Ly*LD.Lz;


%-------------------------------------------------------------------------- 
    str.orig = 'NUM_ATOMS';
    str.change = [int2str(size(LD.pos,1))];
    str.cmd1 = ['-e ''s/\<' str.orig '\>/' str.change '/g'' '];
    
    str.orig = 'LX';
    str.change = [num2str( LD.Lx )];
    str.cmd2 = ['-e ''s/\<' str.orig '\>/' str.change '/g'' '];
    str.orig = 'LY';
    str.change = [num2str( LD.Ly )];
    str.cmd3 = ['-e ''s/\<' str.orig '\>/' str.change '/g'' '];
    str.orig = 'LZ';
    str.change = [num2str( LD.Lz )];
    str.cmd4 = ['-e ''s/\<' str.orig '\>/' str.change '/g'' '];
    
    str.cmd5 =...
    ['lmp.in.x0.lj.tmp > lmp.in.x0'];

    str.cmd =...
        ['sed ' str.cmd1 str.cmd2 str.cmd3 str.cmd4 str.cmd5 ];

    system(str.cmd);
    
%insert pos_tmp which has the dx displacement    
    output = [LD.id LD.m LD.x LD.y LD.z];
    str.write=strcat('./lmp.in.x0');
    dlmwrite(str.write,output,'-append','delimiter','\t',...
        'precision',strcat('%15.5f'));
%--------------------------------------------------------------------------
%pause
%--------------------------------------------------------------------------
    str.cmd =...
        ['lmp_serial < lmp.in.relax' ];
    system(str.cmd);



%--------------------------------------------------------------------------
%GREP POS------------------------------------------------------------------
%--------------------------------------------------------------------------
    str.str1 = 'grep -A '; 
	str.str2 = int2str(size(LD.pos,1));
	str.str3 = ' "ITEM: ATOMS x y z " ';
	str.str4= strcat('./lmp.dump.pos');
    str.str5 = strcat(' > ./matlab.dump.pos');
	str.str_cmd = [str.str1 str.str2 str.str3 str.str4 str.str5];
%--------------------------------------------------------------------------	
%pause
%--------------------------------------------------------------------------	
	[status,tmp] = system(str.str_cmd);

	str.str1 = 'sed ''s/ITEM: ATOMS x y z //g'' ';
	str.str2 = strcat('./matlab.dump.pos');
	str.str3 = strcat(' > ./matlab.dump.pos2');
	str.str_cmd = [str.str1 str.str2 str.str3];
%--------------------------------------------------------------------------	
%pause
%--------------------------------------------------------------------------	
	[status,tmp] = system(str.str_cmd);

    fid=fopen(strcat('./matlab.dump.pos2'));
    dummy = textscan(fid,'%f%f%f','Delimiter',' ','commentStyle', '--'); 
    fclose(fid);

	LD.pos_relax(:,1) = dummy{1}(1:size(LD.pos,1),:);
	LD.pos_relax(:,2) = dummy{2}(1:size(LD.pos,1),:); 
	LD.pos_relax(:,3) = dummy{3}(1:size(LD.pos,1),:); 

    plot3(...
        LD.pos(:,3) - LD.pos_relax(:,1),...
        LD.pos(:,4) - LD.pos_relax(:,2),...
        LD.pos(:,5) - LD.pos_relax(:,3),'.'...
        )
    
%output relaxed
    output = [LD.NUM_ATOMS LD.NUM_ATOMS LD.Lx LD.Lx LD.Lx];

    x =...
        [ LD.pos(:,1) LD.pos(:,2)...
        LD.pos_relax(:,1) LD.pos_relax(:,2) LD.pos_relax(:,3) ];
    
    dlmwrite(strcat('./x0_relax.data'),...
        output ,'-append','delimiter',' ');
    dlmwrite(strcat('./x0_relax.data'),...
        x ,'-append','delimiter',' ');
    
%--------------------------------------------------------------------------	
pause
%--------------------------------------------------------------------------	

