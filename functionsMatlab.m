% function erosion 
% originalBW = imread("perroygatofuncionmatlab.png");
% se = strel('line',25,300);
% erodedBW = imerode(originalBW,se);
% figure, imshow(originalBW)
% figure, imshow(erodedBW), title('erosion:')
% end

function grow
BW = imread("perroygatofuncionmatlab.png");
se = strel('line',25,300);
BW2 = imdilate(BW,se);
figure, imshow(BW)
figure, imshow(BW2), title('grow:')
end 


% function hitmiss
% bw = imread("perroygatofuncionmatlab.png");
% interval = [0 -1 1 1 1 -1 0 1 0];
% bw2 = bwhitmiss(bw,interval)
% figure, imshow(bw)
% figure, imshow(bw2), title('hitmiss:')
% end


% function skeleton
% bwhite = imread("perroygatofuncionmatlab.tif");
% %Icomplement = imcomplement(bwhite);
% %W = imbinarize(Icomplement);
% %se = strel('line',25,300);
% bwhite2 = bwskel(bwhite);
% %bwhiteout = bwskel(BW);
% figure, imshow(bwhite)
% figure, imshow(bwhite2), title('skeleton:')
% end