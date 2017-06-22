% Generate quadratic class time-lag kernel functions
%
% This function generates kernel functions for various members of
% the quadratic class of Time-Frequency Distributions.
%
%
% Usage:
%
%   kernel = quadknl( kernel_type, lag_window_length, full_kernel [, kernel_options] );
%
%  kernel_type is one of: 'wvd', 'smoothed', 'stft', 'rm', 'cw', 'bjc',
% 'zam','b' , 'mb', 'emd','ckd' and 'mdd'. 
%
% Parameters:
%
%     kernel
%
%	  The kernel is arranged in memory such that the zero time, zero lag
%	  point is located at kernel(0,0), and the positive time-lag
%	  quadrant extends to kernel(lag_window_length/2, lag_window_length/2).
%	  Negative values are indexed from lag_window_length-1 down to
%	  lag_window_length/2 + 1.
%
%     kernel_type
%
%	  A string which defines the parent TF distribution generated by the
%	  kernel, one of:
%
%         'wd'          Wigner Distribution 
%         'wvd'         Wigner-Ville
%         'smoothed'    Smoothed Wigner-Ville
%         'stft'        Short-Time Fourier Transform
%         'rm'          Rihaczek-Margenau
%         'cw'          Choi-Williams
%         'bjc'         Born-Jordan-Cohen
%         'zam'         Zhao-Atlas-Marks
%         'b'           B-distribution
%         'mb'          Modified B-distribution
%         'emb'         Extended Modified B-distribution 
%         'ckd'         Compact Support kernel 
%         'mdd'         Multi Directional kernel
%
%     lag_window_length
%
%	  Size of the generated kernel. Kernel will be defined in
%	  both time and lag dimensions from -(lag_window_length/2) to
%	  +(lag_window_length/2).
%
%     full_kernel
%
%	  A boolean, indicating whether the full kernel is to be
%	  generated, or just the first quadrant (positive time and lag
%	  only).  Passing 1 indicates the former case, while 0
%	  indicates the latter. In the latter case, the returned size
%	  of the kernel will be (lag_window_length+1)/2 in both
%	  dimensions.
%
%     kernel_options
%
%	  Some kernels require extra parameters:
%
%         'smoothed'
%             kernel_option = length of smoothing window
%             kernel_option2 = type of smoothing window, one of: 'rect', 'hann',
%             'hamm', 'bart'
%         'stft'
%             kernel_option = length of smoothing window
%             kernel_option2 = type of smoothing window, one of: 'rect', 'hann',
%             'hamm', 'bart'
%         'cw'
%             kernel_option = Smoothing parameter
%         'zam'
%             kernel_option = ZAM 'a' parameter
%         'b'
%             kernel_option = B-distribution smoothing parameter beta
%         'mb'
%             kernel_option = modified B-distribution parameter alpha  
%
%         'emb'
%             kernel_option = modified B-distribution parameter alpha and
%             beta
%         'ckd'
%             kernel_option = compact support-distribution parameter C, D
%             and E
%
%         'mdd'
%             kernel_option = multi directional-distribution parameter C,
%             D, E and Theta
%
%  See Also: quadtfd

% TFSAP 7.1
% Copyright Prof. B. Boashash