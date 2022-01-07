function result = Testing( imagepath , FM )
img = imread(imagepath);
faceDetector = vision.CascadeObjectDetector;
Faces = step(faceDetector,img);
face = imcrop(Img,Faces(1,:));
face = imresize(face,[320 243]);
enhanced = MSRCR_go(face,[15, 80, 250],[1/3,1/3,1/3],125,46,0.354,352);
Features=Get_wavelet_features(enhanced,2);
simiarityy  = sum(FM(:,i).*Features)/sqrt(sum(FM(:,i).^2)*sum(Features.^2));;
[minn,index] = min(simiarityy);
if minn > 0.6
    result = 'true';
else
    result = 'false';
end
end

