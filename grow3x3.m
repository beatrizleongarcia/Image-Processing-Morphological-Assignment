%1 white and 0 black

function grow3x3 = grow3x3(BLACKWHITE,n,m)
    grow3x3 = ones(n,m);
    map = ones(n+2,m+2); %MARCO
    map(2:2+n-1,2:2+m-1) = BLACKWHITE;
    for i=1:n
        for j=1:m
            structure = map(i:i+2,j:j+2);
            if((BLACKWHITE(i,j)==1)&&(sum(structure,'all')==9))
                grow3x3(i,j) = BLACKWHITE(i,j); 
            else
                grow3x3(i,j) = 0; %CAMBIAR A NEGRO PARA CRECER (AÑADIR DIBUJO)
            end
        end
    end
end
