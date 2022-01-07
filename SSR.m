function RentixImg = SSR(OrigImg,gama)
    OrigImg = im2double(OrigImg);
    [Row, Col, Channels] = size(OrigImg);
    RentixImg = zeros(Row, Col, Channels);
 
    for i=1:3
        estimated_illumination = Gauss1DFilter(OrigImg(:,:,i), gama);
        estimated_illumination = estimated_illumination + 0.01;     %to avoid zeros
        Img = OrigImg(:,:,i) + 0.01;
        div = Img ./ estimated_illumination;
        res1 = log(div);
        RentixImg(:,:,i) = res1;
    end
%      RentixImg = Contrast(RentixImg, 0, 255);

end


