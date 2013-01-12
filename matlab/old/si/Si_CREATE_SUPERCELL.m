
    str.main=strcat('/home/jason/Documents/matlab/si/');

    %INITIAL POSITIONS: Set initial positions for id matching
    str.read=strcat(str.main,'LJ_CONV_UC.txt');
    dummy = load(str.read);
    %Define box size and conventional cell lattice parameters
    LD.latvec(1,1) = dummy(1,1); LD.latvec(1,2) = dummy(1,2); LD.latvec(1,3) = dummy(1,3);
    LD.latvec(2,1) = dummy(2,1); LD.latvec(2,2) = dummy(2,2); LD.latvec(2,3) = dummy(2,3);    
    LD.latvec(3,1) = dummy(3,1); LD.latvec(3,2) = dummy(3,2); LD.latvec(3,3) = dummy(3,3);
    %first 3 rows are the lattice vectors
    LD.x.direct = dummy(4:length(dummy),:);
    
    LD.x.cart(:,1) = LD.x.direct(:,1)*LD.latvec(1,1) + LD.x.direct(:,2)*LD.latvec(2,1) + LD.x.direct(:,3)*LD.latvec(3,1) ;
	LD.x.cart(:,2) = LD.x.direct(:,1)*LD.latvec(1,2) + LD.x.direct(:,2)*LD.latvec(2,2) + LD.x.direct(:,3)*LD.latvec(3,2) ;
	LD.x.cart(:,3) = LD.x.direct(:,1)*LD.latvec(1,3) + LD.x.direct(:,2)*LD.latvec(2,3) + LD.x.direct(:,3)*LD.latvec(3,3) ;
%number of unit cell copies in the directions    
LD.Nx = 3; LD.Ny = 3; LD.Nz = 3;

N_cnt = 1;
for iNx = 0:LD.Nx
    for iNy = 0:LD.Ny
        for iNz = 0:LD.Nz
            LD.SC.x( (N_cnt-1)*size(LD.x.direct,1)+1:(N_cnt)*size(LD.x.direct,1) ,3) = LD.x.cart(:,1) + iNx * LD.latvec(1,1) + iNy*LD.latvec(2,1) + iNz*LD.latvec(3,1); 
            LD.SC.x( (N_cnt-1)*size(LD.x.direct,1)+1:(N_cnt)*size(LD.x.direct,1) ,4) = LD.x.cart(:,2) + iNx * LD.latvec(1,2) + iNy*LD.latvec(2,2) + iNz*LD.latvec(3,2);
            LD.SC.x( (N_cnt-1)*size(LD.x.direct,1)+1:(N_cnt)*size(LD.x.direct,1) ,5) = LD.x.cart(:,3) + iNx * LD.latvec(1,3) + iNy*LD.latvec(2,3) + iNz*LD.latvec(3,3);
            N_cnt =N_cnt+1;
        end
    end
end
            
LD.SC.x(:,1) = 1:size(LD.SC.x,1);
LD.SC.x(:,2) = 1;

plot3(LD.SC.x(:,3),LD.SC.x(:,4),LD.SC.x(:,5),'.')

str.write=strcat(str.main,'x0.data');

output = [size(LD.SC.x,1) size(LD.x.cart,1) LD.latvec(1,1)*(LD.Nx+1) LD.latvec(2,2)*(LD.Ny+1) LD.latvec(3,3)*(LD.Nz+1) ];

dlmwrite(str.write,output,'-append','delimiter',' ');

dlmwrite(str.write,LD.SC.x,'-append','delimiter',' ');

            