%1 white and 0 black

function erosion5X5 = erosion5x5(BLACKWHITE,n,m)
    erosion5X5 = ones(n,m);
    map = ones(n+4,m+4);  %MARCO
    map(3:3+n-1,3:3+m-1) = BLACKWHITE; 
    patron = zeros(5,5);
    for i=1:n
        for j=1:m
            structure=map(i:i+4,j:j+4);
            if(isequal(structure,patron))
                erosion5X5(i,j) = BLACKWHITE(i,j); 
            else
                erosion5X5(i,j) = 1; %CAMBIAR A BLANCO PARA ADELGAZAR (PONER FONDO) 
            end
        end
    end
end