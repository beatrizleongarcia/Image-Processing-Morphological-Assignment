%principal window with some buttons 
function menu
    global  BLACKWHITE SIZE OPERATION PROCESSBUTTON HMPATTERN 
    close all;
    SIZE = 3; 
    OPERATION = 'skeleton';
    PROCESSBUTTON = [];
    HMPATTERN = [];
    figure ('Color',[0.85 0.85 0.85], 'Position', [180 30 1100 640], 'Name', 'Image Processing', 'NumberTitle','off');
    clf;
    im1 = imread("yoenlaorla.png");
    im2 = imread("titulo.png");
    im3 = imread("ceuynombre.png");
    subplot (2,2,2);
    image(im1);
    axis("off");
    subplot (2,2,3);
    image(im2);
    axis("off");
    subplot (2,2,4);
    image(im3);
    axis("off");
    
    %create HELP
    uicontrol('Style','pushbutton','String','HELP', 'BackgroundColor',[1 1 1], 'Position',[25 590 140 30], 'Callback', @uihelp);
    
    %create EXIT
    uicontrol('Style','pushbutton','String','EXIT', 'BackgroundColor',[1 1 1], 'Position',[1000 30 70 20], 'Callback', @byebyeclose );
    
    %create UPLOAD IMAGE
    uicontrol('Style','pushbutton','String','UPLOAD IMAGE', 'BackgroundColor',[1 1 1], 'Position',[110 530 120 40], 'Callback', @getimgage);

end

%function help window
function uihelp(source,event) 
    figure ('Color',[1 1 1], 'Position', [180 30 1100 640], 'Name', 'HELP window', 'NumberTitle','off');
    clf;
    help1 = imread("help1.png");
    help2 = imread("help2.png");
    help3 = imread("help3.png");
    help4 = imread("help4.png");
    helpexit = imread("helpexit.png");
    helpclose = imread("helpclose.png");
    subplot (2,3,1);
    image(help1);
    axis("off");
    subplot (2,3,2);
    image(help2);
    axis("off");
    subplot (2,3,3);
    image(help3);
    axis("off");
    subplot (2,3,4);
    image(help4);
    axis("off");
    subplot (2,3,5);
    image(helpexit);
    axis("off");
    subplot (2,3,6);
    image(helpclose);
    axis("off");
end 


%function to get the image choosen
function getimgage(source,event)
    global BLACKWHITE
    FILE = uigetfile('*.*');
    RGB = imread(FILE);
    I = rgb2gray(RGB);
    BLACKWHITE = im2bw(I,0.5);
    [n,m]= size(BLACKWHITE);
    BG= ones(n,m);
    subplot(1,2,1);
    imshow(BLACKWHITE);
    xlabel('Choosen image:')
    subplot(1,2,2);
    imshow(BG);
    xlabel('Processed image:')

    getsize();
end 


%function of size (3x3, 5x5)
function getsize (source,event)
    uicontrol('Style','text','String','Select Window Size', 'Position',[350 575 140 15]);
    uicontrol('Style','popupmenu','units','pixels','Position',[350 550 140 20], 'String',{'3x3', '5x5', '7x7'},'Callback', @getoperation);
end


%function of operation (erosion, grow, skeleton, hit/miss)
function getoperation (source,event)
    global SIZE
    if (source.String{source.Value}=='3x3')
        SIZE = 3;
    elseif (source.String{source.Value}=='5x5')
        SIZE = 5;
    else 
        SIZE = 7;
    end
    uicontrol('Style','text', 'String','Select Operation', 'Position',[550 575 140 15]);
    uicontrol('Style','popupmenu','units','pixels','Position',[550 550 140 20], 'String',{'Erosion','Grow','Skeleton','Hit/Miss'},'Callback', @dooperation);
end


%function to do the operation
function dooperation (source,event)
    global OPERATION PROCESSBUTTON
    OPERATION =source.String{source.Value};
    runbutton();
    if (strcmp(OPERATION, 'Hit/Miss'))
        delete(PROCESSBUTTON);
        uicontrol('Style','pushbutton','String','Select file Pattern', 'BackgroundColor', [1 1 1], 'Position', [750 575 150 50], 'Callback', @patternmatrixfile);
    end
end


%function pattern of hit and miss in a excel file
function patternmatrixfile (source,event)
    global HITMISSPATTERN
    FILE = uigetfile ('*.*');
    HITMISSPATTERN = readmatrix(FILE);
    runbutton();
end

%function RUN button 
function runbutton (source,event)
    global PROCESSBUTTON
    PROCESSBUTTON = uicontrol('Style','pushbutton','String','RUN', 'BackgroundColor',[1 1 1], 'Position', [1000 550 70 50], 'Callback', @running);
end


%function of running
function running (source,event)
    global SIZE OPERATION HITMISSPATTERN BLACKWHITE PROCESSBUTTON
    I = imread("titulo.png");
    subplot(1,2,2);
    imshow(I);
    delete(PROCESSBUTTON);
    pause(0.5);
    [n,m] = size(BLACKWHITE);
    if (strcmp(OPERATION, 'Skeleton'))
        if(SIZE == 3)
            I = skeleton3x3(BLACKWHITE,n,m);
        elseif(SIZE == 5)
            I = skeleton5x5(BLACKWHITE,n,m);
        else
            I = skeleton7x7(BLACKWHITE,n,m);
        end

    elseif(strcmp(OPERATION, 'Erosion'))
        if(SIZE == 3)
            I = erosion3x3(BLACKWHITE,n,m);
        elseif(SIZE == 5)
            I = erosion5x5(BLACKWHITE,n,m);
        else
            I = erosion7x7(BLACKWHITE,n,m);
        end
    
    elseif(strcmp(OPERATION, 'Grow'))
        if(SIZE == 3)
            I = grow3x3(BLACKWHITE,n,m);
        elseif(SIZE == 5)
            I = grow5x5(BLACKWHITE,n,m);
        else 
            I = grow7x7(BLACKWHITE,n,m);
        end

    else 
        if(SIZE == 3)
            I = hitmiss3x3(BLACKWHITE,n,m,HITMISSPATTERN);
        elseif(SIZE == 5)
            I = hitmiss5x5(BLACKWHITE,n,m,HITMISSPATTERN);
        else
            I = hitmiss7x7(BLACKWHITE,n,m,HITMISSPATTERN);
        end
    end 
        subplot(1,2,2);
        imshow(I);
        xlabel('Processed Image:');
end


%function to close
function byebyeclose (source, event)
    close all;
end
