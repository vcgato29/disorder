function lj = m_lj
% lj = m_lj returns an lj structrue with Ar parameters
%--------------------------------------------------------------------------
lj.eps = 1.67E-21;              
lj.sigma = 3.4E-10;                
lj.mass = 6.6326E-26;               
lj.tau = sqrt((lj.mass*(lj.sigma^2))/lj.eps); 
end
%--------------------------------------------------------------------------	

