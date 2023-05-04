%1 white and 0 black

function erosion7X7 = erosion7x7(BLACKWHITE,n,m)
    erosion7X7 = ones(n,m);
    map = ones(n+6,m+6);  %MARCO
    map(4:4+n-1,4:4+m-1) = BLACKWHITE; 
    patron = zeros(7,7);
    for i=1:n
        for j=1:m
            structure=map(i:i+6,j:j+6);
            if(isequal(structure,patron))
                erosion7X7(i,j) = BLACKWHITE(i,j); 
            else
                erosion7X7(i,j) = 1; %CAMBIAR A BLANCO PARA ADELGAZAR (PONER FONDO) 
            end
        end
    end
end