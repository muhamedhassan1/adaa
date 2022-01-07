function New = Gauss1DFilter(Old, Sigma)
    MskSize = 2 * int32(3.7 * Sigma - 0.5) + 1;
    GF1D = fspecial('gaussian', [1 double(MskSize)], Sigma) ;
    horBlur = imfilter(Old, GF1D) ;
    New = imfilter(horBlur, GF1D') ;
end
