function [direct cart latvec latvec_rec] = m_lj_unit_cell_conv( alat )

latvec = 	[1.0 0.0  0.0 
                    0.0  1.0 0.0 
                    0.0  0.0  1.0 ];
            
direct = 	[0.0  0.0  0.0
                        0.5  0.5  0.0
                        0.5  0.0  0.5
                        0.0  0.5  0.5];

cart = m_direct2cart( direct , (alat)*latvec );

latvec_rec = [1.0 0.0  0.0 
                    0.0  1.0 0.0 
                    0.0  0.0  1.0];

end
