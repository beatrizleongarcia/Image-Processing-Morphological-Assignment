%1 white and 0 black

function grow5X5 = grow5x5(BLACKWHITE,n,m)
    grow5X5 = ones(n,m);
    map = ones(n+4,m+4); %MARCO
    map(3:3+n-1,3:3+m-1) = BLACKWHITE;
    for i=1:n
        for j=1:m
            structure = map(i:i+4,j:j+4);
            if((BLACKWHITE(i,j)==1)&&(sum(structure,'all')==25))
                grow5X5(i,j) = BLACKWHITE(i,j); 
            else
                grow5X5(i,j) = 0; %CAMBIAR A NEGRO PARA CRECER (AÑADIR DIBUJO)
            end
        end
    end
end
