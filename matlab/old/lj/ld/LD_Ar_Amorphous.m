tic
%function NanoMD

%Jason Larkin
%November 02, 2010
%Description: MD code to simulate Nanoparticle for MD Class. 
%This code uses units derived from the energy and length scale of the
%Lennard-Jones potential.
%-------------------------------------------------------
%-------------PROGRAM PARAMETERS------------------------
%-------------------------------------------------------
%Declare Global Variables
ncell=10;                           %number of unit cells used in x,y,z
%N=2^(3*ncell-1);                   %number of atoms based on ncells

L(1,1:3)=zeros(1,3);                %contains the simulation cell size
pi = atan(1)*4;                     %contains value of pi, in C this would be pi = atan(1) * 4
%LJ Potential and Material Parameters
epsilon_Ar = 1.67E-21;              %aJ (1.67E-21 Joules) aJ=1E-18 J
sigma_Ar = 3.4E-10;                 %Angstroms 3.4E-10 meters
a_0 = 5.2686E-10/sigma_Ar;            %the lattice constant of Ar: http://www.infoplease.com/periodictable.php?id=18
mass_Ar = 6.6326E-26;               %1E-28 kg (6.6326E-26 kg)
%mass_Ar = mass_Ar/mass_Ar;
tau_Ar = sqrt((mass_Ar*(sigma_Ar^2))/epsilon_Ar);
kb = 1.3806E-23;                    %aJ/k (1.3806E-23 J/K)
hbar = 1.054E-34;                %J/s

%Main Arrays (M X N)
%x(1:N,1:3)=zeros(N,3);              %position
%m(1,1:N) = zeros(N,1);              %mass of the particle
%m(1,1:N) = 1; 
%ident_letter(1,1:N)=zeros(N,1);     %letter identifying the particle, e.g. C, N, etc.
rij(1,1:3)=0;                       %pairwise distance between atoms i and j
%F(1:N,1:3)=zeros(N,3);              %force on particle (1E-28 kg Anstromg/fs)

RDF = zeros(5000,2);

V = 0; 
P_virial = 0;
P = 0;
%%%%%Cutoffs
a = 2.5;                            %Angstroms cutoff radius in terms of sigma_Ar 
a2 = a*a;
cutoff = 0;                         %true=1, use the cutoff radius. This of course introduces a discontinuity in the force at r=a
%Calculate Potential Energy cutoff value
pe_cutoff = pe(a2);
%Calculate Force Cutoff value
f_cutoff=force_eval(a2);

%Set initial conditions if the simulation is not a restart
RESTART=0;
%Set to run in NVE to initialize from 0 K state
rescale=0;

%-------------------------------------------------------
%------------Program------------------------------------
%-------------------------------------------------------

%1) read_data
        str_main='E:\CMU\work\Phonons\LJArgon\Solid\amorphous\quench\direct\from_300K_vol_0.99\anneal_to_15K\dispersion\npt_relax\2\';
        %str_main='E:\CMU\work\Phonons\Lattice_Dynamics\Matlab\';
        %str=strcat(str_main,'LJ_rand_mass_binary.in.data');
        %str=strcat(str_main,'FCC_4atom_Ar.txt');
        str=strcat(str_main,'npt_relax_from_300K_matlab.dump');
        %dummy = dlmread(str);       %read in initial positions 
        %N = length(dummy)-1;
        %L = dummy(1,1:3);
        %m = dummy(2:N+1,1); 
        %x = dummy(2:N+1,2:4); x = x*L(1);
        %sizex=size(x); N=sizex(1,1);
        %alat = dummy(1,:); %alat(1,1:3) = alat(1,1:3)/(sigma_Ar*10^10);
        %clear dummy
        %x(:,1) = x(:,1)*alat(1,1); x(:,2)= x(:,2)*alat(1,2); x(:,3) = x(:,3)*alat(1,3); 
        num_ucells = ceil(a/alat(1,1));
%2) Build up the unit cell images        
            [x_ucell, x_ucell2, cell_index] = build_ucells (x,alat,num_ucells);
%3) find initial forces/pressure
            V=alat(1,1)*alat(1,2)*alat(1,3);
%4) Calculate dynamical matrix 
%         dk = (4*pi/alat(1,1))/100;
%         k=-(pi/alat(1,1)):dk:(pi/alat(1,1));
%         %x = x + 100; x_ucell(:,1:3) = x_ucell(:,1:3) +100; 
%         for j=1:length(k)
%            kappa = [k(j),k(j),k(j)];
%            i=sqrt(-1);
%            [D,PHI1,PHI2,PHI3] = dynam_matrix(a2,x,x_ucell,m,kappa);
%            freq(j,1:length(eig(D)))=abs(sqrt(eig(D)));    
%         end
%         
%         plot(freq,'.')
%         
%         pause
        
        %GAMMA POINT calculation
%         [D,PHI1,PHI2,PHI3] = dynam_matrix(a2,x,x_ucell,m,[0.0,0.0,0.0]);
%         [eigV,W2]=eig(D); W=sqrt(W2);


        %Zone Edge calculation
          [D,PHI1,PHI2,PHI3] = dynam_matrix(a2,x,x_ucell,m,[0.0,0.0,0.0]);
          [eigV,W2]=eig(D); W=sqrt(W2);
          freq(1:length(eig(D)))=sort(abs(sqrt(eig(D))));  
                  plot(freq,'.')
                  
                  pause

% 
%   toc      
%         for i=1:length(W)
%             w(i) = W(i,i);
%         end   
%         w_sort = sort(real(w));
%         
%         %Calculate DOS        
%         [DOS(:,2),DOS(:,1)] = hist(real(w),30);
% 
% %5) Calculate Participation Ratios
%         eps2(1:3*N)=0;
%         for i=1:1:3*N
%                 for j=1:3:3*N  
%                     eps2(i) = eps2(i) + (sum(conj(eigV(j:j+2,i)).*eigV(j:j+2,i)))^2;
%                 end
%                 p(i,1) = W(i,i);
%                 p(i,2) = 1/(N*eps2(i));
%         end
%         plot(real(p(:,1)),p(:,2),'.')
%   
%        str=strcat(str_main,'p.dat');
%        dlmwrite(str,real(p));
  
% %6) Calcualte mode weight factor
%         fweight(
%         for i=1:1:N
%                 for j=1:3:3*N  
%                     fweight(i) = fweight(i) + sum(eigV(j:j+2,i).^2);
%                 end
%                 p(i,1) = W(i,i);
%                 p(i,2) = 1/(N*eps2(i));
%         end
        
%7) Calculate mode polarization
%         pol(1:3*N,1:3*N)=0;
%         for i=1:1:3*N
%                 for j=1:3:3*N  
%                     pol(j:j+2,i) = eigV(j:j+2,i)/sum(conj(eigV(j:j+2,i)).*eigV(j:j+2,i));
%                 end
%         end
%         plot(pol)

 
    

%8) Calculate thermal diffusivity matrix

%         [diffx,diffy,diffz,diff] = therm_diff_5(D,eigV,W,PHI1,PHI2,PHI3,V,hbar,epsilon_Ar,tau_Ar,a2,x,x_ucell,m,[0.0,0.0,0.0]);              
%         diff = diff*(sigma_Ar^2)/tau_Ar;        
%         plot(w/tau_Ar,diff);       
%         therm_cond = sum(kb*diff)/((alat(1,1)*sigma_Ar)^3)
        
%         for i=1:3*N
%         str=strcat(str_main,'w.dat');
%         dlmwrite(str,real(w(i)),'-append','delimiter',' '); dlmwrite(str,imag(w(i)),'-append','delimiter',' ');
%         end

%Spit out "dynamical" matrix, eigvectors and frequencies
%         str=strcat(str_main,'w_real.dat');
%         dlmwrite(str,real(w),'delimiter',' ');
%         str=strcat(str_main,'w_imag.dat');
%         dlmwrite(str,imag(w),'delimiter',' ');
%         str=strcat(str_main,'w_sort.dat');
%         dlmwrite(str,real(w_sort),'delimiter',' ');
%         str=strcat(str_main,'DOS.dat');
%         dlmwrite(str,DOS,'delimiter',' ');
%         
%         str=strcat(str_main,'eigV_real.dat');
%         dlmwrite(str,real(eigV),'delimiter',' ');
%         str=strcat(str_main,'eigV_imag.dat');
%         dlmwrite(str,imag(eigV),'delimiter',' ');
%         
%         str=strcat(str_main,'PHI1_real.dat');
%         dlmwrite(str,real(PHI1),'delimiter',' ');
%         str=strcat(str_main,'PHI1_imag.dat');
%         dlmwrite(str,imag(PHI1),'delimiter',' ');
%         
%         str=strcat(str_main,'PHI2_real.dat');
%         dlmwrite(str,real(PHI2),'delimiter',' ');
%         str=strcat(str_main,'PHI2_imag.dat');
%         dlmwrite(str,imag(PHI2),'delimiter',' ');
%         
%         str=strcat(str_main,'PHI3_real.dat');
%         dlmwrite(str,real(PHI3),'delimiter',' ');
%         str=strcat(str_main,'PHI3_imag.dat');
%         dlmwrite(str,imag(PHI3),'delimiter',' ');





















%-------------------------------------------------------
%------------FUNCTIONS----------------------------------
%-------------------------------------------------------

% function phi=pe(r2)
% %FUNCTION: evaluate the potential energy for a given separation r2
%     inv_r6 = 1./(r2*r2*r2);
%     phi = 4.*(inv_r6*inv_r6 - inv_r6);
% %end
% 
% 
% function f=force_eval(r2)
% %FUNCTION: evaluate magnitude of the force for given separation r2
%     %using the method derived here:
%     %http://www.pages.drexel.edu/~cfa22/msim/node36.html
%     r4 = r2*r2; r8 = r4*r4; r14i = 1/(r8*r4*r2);
%     f = 48*r14i - 24*r4*r2*r14i;
% %end
% 
% function f=curv_eval(r2)
% %FUNCTION: evaluate magnitude of the force for given separation r2
%     %using the method derived here:
%     %http://www.pages.drexel.edu/~cfa22/msim/node36.html
%     r4 = r2*r2; r8 = r4*r4; r14i = 1/(r8*r4*r2);
%     f = 48*r14i - 24*r4*r2*r14i;
% %end
% 
% function [F,P,P_virial]=force(N,L,a2,f_cutoff,a,x,cutoff,V,T)
% %FUNCTION: find forces acting on all atoms in system.
%     %clear old Forces
%     F(1:N,1:3)=zeros(N,3);
%     P_viral = 0;
%     for i=1:N
%         for j=(i+1):N
%                 for k=1:3
%                     rij(1,k) = x(i,k) - x(j,k);
%                     rij(1,k) = periodic(rij(1,k),L(1,k));   %periodic boundaries
%                 end
%                     r2 = rij(1,1)^2 + rij(1,2)^2 + rij(1,3)^2;
%                     if r2<a2
%                         if cutoff == 1
%                             f = force_eval(r2);
%                             %f = force_eval(r2) - f_cutoff*a*(1/sqrt(r2));
%                         else
%                             %f = force_eval(r2) - f_cutoff*a*(1/sqrt(r2));
%                             f = force_eval(r2);
%                         end
%                         for k=1:3    
%                             F(i,k) = F(i,k) + rij(1,k)*f;
%                             F(j,k) = F(j,k) - rij(1,k)*f;
%                         end
%                         P_viral = P_viral +r2*f;
%                     end
%         end
%     end
%     %P = (P_viral/(3*V)) + ((N*T)/V);
%     %Set P and Pset to 1 for the purpose of NanoMD
%     P=1;
% %end
% 
% function [C]=force_matrix(N,L,a2,f_cutoff,a,x,cutoff)
% %FUNCTION: find forces acting on all atoms in system.
%     %clear old Forces
%     F(1:N,1:3)=zeros(N,3);
%     for i=1:N
%         for j=1:N
%                         for k=1:3
%                             rij(1,k) = x(i,k) - x(j,k);
%                             rij(1,k) = periodic(rij(1,k),L(1,k));   %periodic boundaries
%                         end
%                         r2 = rij(1,1)^2 + rij(1,2)^2 + rij(1,3)^2;
%                             if r2<a2
%                                 if cutoff == 1
%                                     f = force_eval(r2);
%                                     k_spring = curv_eval(r2);
%                                     %f = force_eval(r2) - f_cutoff*a*(1/sqrt(r2));
%                                 else
%                                     %f = force_eval(r2) - f_cutoff*a*(1/sqrt(r2));
%                                     f = force_eval(r2);
%                                     k_spring = curv_eval(r2);
%                             end
%                                 for k=1:3    
%                                     F(i,k) = F(i,k) + rij(1,k)*f;
%                                     F(j,k) = F(j,k) - rij(1,k)*f;
%                                     for l=1:3
%                                         C((i-1)*3+k,(j-1)*3+l) = (k_spring/r2)*(rij(1,k)*rij(1,l));  
%                                     end                       
%                                 end
%             end
%         end
% %end
% 
% function PE=Pot_Energy(N,L,pe_cutoff,a,a2,f_cutoff,cutoff,x)
% %FUNCTION: calcualte the total Potential Energy in the system.
%     PE=0;
%     for i=1:N
%         for j=(i+1):N
%             for k=1:3
%                 rij(1,k) = x(i,k) - x(j,k);
%                 rij(1,k) = periodic(rij(1,k),L(1,k));  %periodic boundaries
%             end
%             r2 = rij(1,1)^2 + rij(1,2)^2 + rij(1,3)^2;
% 
%             if (r2<a2)
%                 if cutoff==1
%                     PE = PE + pe(r2) - pe_cutoff;
%                 else
%                     PE = PE + pe(r2);
%                 end
%             end
%         end
%     end
% %end
