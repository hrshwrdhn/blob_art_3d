function sheppmat = slphantom3_data()
%parameters of ellipsoid in  phantom
%            A      a     b     c       x0      y0      z0     phi     theta   psi
%        ------------------------------------------------------------------------
sheppmat = [1     .5  .5  .5          .25       .25     .25      0    0  0;
            -.75   .25  .25 .25         .35       .2      .15      0  0  0    ];
end
