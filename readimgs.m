function FM = readimgs( path )
    imagesfile = dir(fullfile(path,'*.pgm*'));
    FM=[];
    for i = 1:size(imagesfile,1)
        face = imread(fullfile(path,imagesfile(i).name));
        
        [h,w]=size(face);
        rgb = zeros(h,w,3);
        rgb(:,:,1) = face;
        rgb(:,:,2) = face;
        rgb(:,:,3) = face;
        face = uint8(rgb);
        
        enhanced = MSRCR_go(face,[15, 80, 250],[1/3,1/3,1/3],125,46,0.354,352);
        %enhanced = MSR(face,[15, 80, 250],[1/3,1/3,1/3]);
       
        
        %enhanced = shadoww(enhanced);
        %enhanced = medfilt2(rgb2gray(enhanced),[3 3]);
        %imshow(enhanced);
        Features=Get_wavelet_features(enhanced,2);
        FM = [FM,Features(:)];     
    end
    %[Gen, Imp,FV,d_prime,acc] = GenImpCurve(FM, 38, 14, 3, 'c');
    
    %[FMRs, FNMRs] = DETCurve(Gen, Imp, 100);
    %[EER, HTER, TMR] = VerMetrics(FMRs, FNMRs, 1);
    %EER = EER


end

