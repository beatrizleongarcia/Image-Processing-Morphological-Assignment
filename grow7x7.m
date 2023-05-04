%1 white and 0 black

function grow7x7 = grow7x7(BLACKWHITE,n,m)
    grow7x7 = ones(n,m);
    map = ones(n+6,m+6); %MARCO
    map(4:4+n-1,4:4+m-1) = BLACKWHITE;
    for i=1:n
        for j=1:m
            structure = map(i:i+6,j:j+6);
            if((BLACKWHITE(i,j)==1)&&(sum(structure,'all')==49))
                grow7x7(i,j) = BLACKWHITE(i,j); 
            else
                grow7x7(i,j) = 0; %CAMBIAR A NEGRO PARA CRECER (AÑADIR DIBUJO)
            end
        end
    end
end
