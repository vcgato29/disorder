function vel =...
    m_gulp_vel_si(kpt,NUM_ATOMS_UCELL,MASS,ALAT,str_main,str_matlab,name)
%--------------------------------------------------------------------------
%freq = gulp_lj_vel(kpt,NUM_ATOMS_UCELL)
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%This is required to get the kpt + dk to properly input to GULP
    format long
%--------------------------------------------------------------------------

constant = m_constant;
lj = m_lj;

gulp.dk = 1E-4;

%2) Input dk kpts to measure group velocities
	vel = zeros(3*NUM_ATOMS_UCELL,3);		

for idim = 1:3
    if kpt(idim)==0.5
        freq = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        kpt(idim) = kpt(idim) - gulp.dk;
        freq_mdk = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        vel(:,idim) = (( freq - freq_mdk )/ gulp.dk / 4 );
    %Put kpt back to orig
        kpt(idim) = kpt(idim) + gulp.dk;

    elseif kpt(idim)==-0.5
        freq = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        kpt(idim) = kpt(idim) + gulp.dk;
        freq_pdk = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        vel(:,idim) = (( freq_pdk - freq )/ gulp.dk / 4 );
    %Put kpt back to orig
        kpt(idim) = kpt(idim) - gulp.dk;

    elseif kpt(idim)==0.0
        freq = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        kpt(idim) = kpt(idim) + gulp.dk;
        freq_pdk = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        vel(:,idim) = (( freq_pdk - freq )/ gulp.dk / 4 );
    %Put kpt back to orig
        kpt(idim) = kpt(idim) - gulp.dk;

    else
        freq = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        kpt(idim) = kpt(idim) + gulp.dk;
        freq_pdk = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        kpt(idim) = kpt(idim) - 2*gulp.dk;
        freq_mdk = m_gulp_freq_lj(kpt,NUM_ATOMS_UCELL,MASS,ALAT,...
            str_main,str_matlab,name);
        vel(:,idim) = (( freq_pdk - freq_mdk )/ gulp.dk / 8 );
    %Put kpt back to orig
        kpt(idim) = kpt(idim) + gulp.dk;
    end
end



end

