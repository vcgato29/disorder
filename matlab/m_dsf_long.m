
function DSF =...
    m_dsf_long( str , kpt , x0 , freqp, eigvec, alat , heav_fac, T, mass )
%M_DSF_LONG
%	DSF =...
%   m_dsf_long( str , kpt , x0 , freqp, eigvec, alat , heav_fac, T, mass )
%	
%	kpt is expected to have form:
%
%	kpt(:,1) = 0...0.5
%	x0(:,1)==atomid, x0(:,2)==typeid, x0(:,3:5)=xyz
%	freq(1:NUM_MODES)
%	eigvec(3*NUM_ATOMS,NUM_MODES)
%--------------------------------------------------------------------------
tic
%--------------------------------------------------------------------------

lj = m_lj; constant = m_constant;
%scale by lattice constant
KX = kpt(:,1)/alat;
KY = kpt(:,2)/alat;
KZ = kpt(:,3)/alat;

spatial =...
    bsxfun( @times , x0.x , KX' ) +...
    bsxfun( @times , x0.y , KY' ) +...
    bsxfun( @times , x0.z , KZ' );

for imode = 1:size(freqp,1)
    
eig_fftx(imode,1:size(kpt,1)) =...
    sum(...
        bsxfun(@times,...
            bsxfun(@times,...
                exp( 2*pi*1i*( spatial )),...
                KX'./sqrt(KX'.^2+KY'.^2+KZ'.^2 )...
                ),...
            eigvec(1:3:size(eigvec,1),imode)...
        )...
    ,1);

eig_ffty(imode,1:size(kpt,1)) =...
    sum(...
    bsxfun(...
    @times ,...
    bsxfun(@times,exp( 2*pi*1i*( spatial )),...
    KY'./sqrt(KX'.^2+KY'.^2+KZ'.^2 )) ,...
    eigvec(2:3:size(eigvec,1),imode) )...
    , 1);

eig_fftz(imode,1:size(kpt,1)) =...
    sum(...
    bsxfun(...
    @times ,...
    bsxfun(@times,exp( 2*pi*1i*( spatial )),...
    KZ'./sqrt(KX'.^2+KY'.^2+KZ'.^2 )) ,...
    eigvec(3:3:size(eigvec,1),imode) )...
    , 1);

EpL(imode,:) =...
    real(eig_fftx(imode,:)).^2 + imag(eig_fftx(imode,:)).^2 +...
    real(eig_ffty(imode,:)).^2 + imag(eig_ffty(imode,:)).^2 +...
    real(eig_fftz(imode,:)).^2 + imag(eig_fftz(imode,:)).^2 ; 

%--------------------------------------------------------------------------
%pause
%--------------------------------------------------------------------------
end

DSF.EpL = EpL;

DSF.freq_range = linspace( 0 , max(freqp) , size(freqp,1) );

size(freqp,1)

for imode = 1:size(freqp,1)

prefactor =...
    (constant.kb/constant.kb)*T*...
    (KX.^2 + KY.^2 + KZ.^2 )...
    /...
    (mass*DSF.freq_range(imode));
    
SL(imode,:) = ...
    prefactor'.*...
    sum(...
    bsxfun(@times,...
    EpL(:,:) ,...
    heaviside(...
    heav_fac -...
    abs( (DSF.freq_range(imode) - freqp) ./ DSF.freq_range(imode) )...
    )...
    ),...
    1);

end

DSF.kpt = kpt;
DSF.SL = SL;
DSF.freqp = freqp;

save(strcat(str,'DSF_long.mat'), '-struct', 'DSF');
%--------------------------------------------------------------------------
toc
%--------------------------------------------------------------------------
end




