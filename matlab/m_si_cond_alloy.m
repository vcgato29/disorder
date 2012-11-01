function cond = m_si_cond_alloy

cond.conc = [0.0 
            0.001 
            0.01 
            0.05 
            0.15 
            0.5]; 
        
cond.size = [4
            6 
            8 
            10]; 
        
cond.vm(1) = 1.0;
cond.vm(2) = 1.001600000000000;
cond.vm(3) = 1.016000000000000;
cond.vm(4) = 1.080000000000000;
cond.vm(5) = 1.240000000000000;
cond.vm(6) = 1.800000000000000;

cond.cond(1,1) = 4.742254054501739e+02;
cond.cond(1,2) = 84.952619570340417;
cond.cond(1,3) = 11.658084786625242;
cond.cond(1,4) = 2.755261669287963;
cond.cond(1,5) = 1.268797577459464;
cond.cond(1,6) = 1.127809095647059;

cond.cond(2,1) = 0;
cond.cond(2,2) = 0;
cond.cond(2,3) = 0;
cond.cond(2,4) = 2.4558;
cond.cond(2,5) = 1.1303;
cond.cond(2,6) = 1.0050;

cond.cond(3,1) = 0;
cond.cond(3,2) = 0;
cond.cond(3,3) = 0;
cond.cond(3,4) = 2.1663;
cond.cond(3,5) = 0.9959;
cond.cond(3,6) = 0.8867;

cond.cond(4,1) = 0;
cond.cond(4,2) = 0;
cond.cond(4,3) = 0;
cond.cond(4,4) = 2.1431;
cond.cond(4,5) = 0.9861;
cond.cond(4,6) = 0.8786;

cond.cond_extrap(1) = 4.57; %0.05
cond.cond_extrap(2) = 2.12; %0.15
cond.cond_extrap(3) = 1.92; %0.5

%plot( flipdim([0 1./[cond.size']],2), [1./[cond.cond(:,6)'] 1/1.92],'.')


cond.garg = 1.0e+02 *[...
                   0   1.296471000000000
   0.000017566000000   0.668235000000000
   0.000040108000000   0.522353000000000
   0.000063210000000   0.442353000000000
   0.000074701000000   0.395293000000000
   0.000098122000000   0.352941000000000
   0.000192000000000   0.251764000000000
   0.000299000000000   0.204706000000000
   0.000382000000000   0.176471000000000
   0.001190000000000   0.096471000000000
   0.001998000000000   0.077647000000000
   0.002807000000000   0.068235000000000
   0.005007000000000   0.068235000000000...
   ];

cond.schelling = [...
    0.0     15.7
    0.1     2.77
    0.2     1.94
    0.5     1.08...
    ];

cond.landry =[...
    0.125 2.6
    0.250 2.4
    0.375 2.0
    0.500 2.3
    0.625 3.4
    0.750 4.2
    0.875 6.1...
        ];


end


