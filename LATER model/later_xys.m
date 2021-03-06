function [xvals_, yvals_] = later_xys(rts)
% function [xvals_, yvals_] = later_xys(rts)
%
% Compute x (-1./rt) and y (probit) values
%   from RT distribution
%
% Copyright 2019 by Joshua I. Gold, University of Pennsylvania

if nargin < 1 || isempty(rts)
    xvals_ = [];
    yvals_ = [];
    return
end

% get empirical cumulative distribution
rtss  = sort(rts);
n     = length(rtss);
rtsc  = ((1:n)./n)';
Lgood = diff([-999; rtss])~=0;

xvals_ = 1./rtss(Lgood);
yvals_ = norminv(rtsc(Lgood),0,1);

