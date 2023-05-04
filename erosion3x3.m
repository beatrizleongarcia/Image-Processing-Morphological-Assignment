%1 white and 0 black

function erosion3x3 = erosion3x3(BLACKWHITE,n,m)
    erosion3x3 = ones(n,m);
    map = ones(n+2,m+2); %MARCO
    map(2:2+n-1,2:2+m-1) = BLACKWHITE; 
    patron = zeros(3,3);
    for i=1:n
        for j=1:m
            structure=map(i:i+2,j:j+2); %por la cuadricula de 3x3
            if(isequal(structure,patron))
                erosion3x3(i,j) = BLACKWHITE(i,j); 
            else
                erosion3x3(i,j) = 1; %CAMBIAR A BLANCO PARA ADELGAZAR (PONER FONDO) 
            end
        end
    end
end