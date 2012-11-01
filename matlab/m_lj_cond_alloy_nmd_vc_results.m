function VC = m_lj_cond_alloy_nmd_vc_results
%VC = m_lj_alloy_nmd_vc_results
%returns the vc thermal conductivity results @ 10K for 4-12x systems
%--------------------------------------------------------------------------

VC.size =[...
    4
    6
    8
    10
    12
    ];

VC.extrap =[...
    3.3298 0.4 
    0.78 0.08
    0.38 0.04
    0.272 0.05
    ];

VC.perfect =[...
	3.3298
	3.1220
	2.8287
	];

end
