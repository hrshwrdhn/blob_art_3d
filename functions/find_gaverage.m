function gbar= find_gaverage(del)
  % gaverage value
  % ref : bekouruum paper 2015
  beta= del/sqrt(2);
  [a,alpha,m]=blob_input(del);
  K= ( ((2*pi)^1.5 )* (a^3 )* (alpha^m)/ besseli(m,alpha) );
  wdash0 = K* besseli(1.5+m, alpha) ./  ( alpha.^(1.5 + m));
  gbar =wdash0/ (4*beta^3);
end
