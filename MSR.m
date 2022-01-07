function msrImg = MSR(Img, Scales, Weights)
    [h ,w ,l] = size(Img);
    
    msrImg = zeros(h,w,l);
    
    scaleN = size(Scales);
    for i=1:scaleN(2)
        
        temp = SSR(Img,Scales(i));
        
        temp = temp .* Weights(i);

        msrImg = msrImg + temp;
    end
 
    msrImg = Contrast(msrImg, 0, 255);

end

