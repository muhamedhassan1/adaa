function v = Get_wavelet_features( img , level )
    v= img;
    [lo_d,hi_d] = wfilters('haar','d');
    for i = 1:level
        [s,ver,hor,dia]= dwt2(v,lo_d,hi_d);
        v= s;
    end

end

