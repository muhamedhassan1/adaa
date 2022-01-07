function Res = MSRCR_go(Img, Scales, Weights, Alpha, Beta, Gain, Offset)
Im = im2double(Img)+0.01;
msr = MSR(Img,Scales,Weights);
[h,w,l] = size(Img);
relative = zeros(h,w,l);
summ = zeros(h,w);
summ = Im(:,:,1)+Im(:,:,2)+Im(:,:,3);
summ = summ +0.01;

for i = 1:3
    relative(:,:,i) = Im(:,:,i) ./ summ;
    restoration = relative(:,:,i) .* Alpha;
    restoration2 = log(restoration);
    restoration3 = restoration2 .* Beta;

    Res(:,:,i) = Gain .* (( restoration3 .* im2double(msr(:,:,i)) ) + Offset );
end


 Res = Contrast(Res, 0, 255);

end

