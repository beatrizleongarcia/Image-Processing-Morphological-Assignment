% 1 WHITE, 0 BLACK AND -1 DOES NOT MATTER

function skeleton5x5=skeleton5x5(BLACKWHITE,n,m)
    skeleton5x5=BLACKWHITE;
    map=ones(n+4,m+4); %MARCO
    map(3:3+n-1,3:3+m-1)=BLACKWHITE;
    %GOLAY´S ALPHABET
    golay=zeros(5,5,8);
    golay(:,:,1)=[1,1,1,1,1;1,1,1,1,1;-1,-1,0,-1,-1;0,0,0,0,0;0,0,0,0,0];
    golay(:,:,2)=[-1,-1,1,1,1;-1,-1,1,1,1;0,0,0,1,1;0,0,0,-1,-1;-1,0,0,-1,-1];
    golay(:,:,3)=rot90(golay(:,:,1),-1);%-1 PARA ROTAR LA MATRIZ 
    golay(:,:,4)=rot90(golay(:,:,2),-1);
    golay(:,:,5)=rot90(golay(:,:,3),-1);
    golay(:,:,6)=rot90(golay(:,:,4),-1);
    golay(:,:,7)=rot90(golay(:,:,5),-1);
    golay(:,:,8)=rot90(golay(:,:,6),-1);

    iguales=false;
    while (~iguales)  
        inicial=skeleton5x5;
        for s=1:8
            pat=golay(:,:,s);
            for i=1:n
                for j=1:m
                    structure=map(i:i+4,j:j+4);
                    k=0;
                    continuous=true;
                    while(continuous &&(k<25))
                        x=fix(k/5)+1; 
                        y=mod(k,5)+1;
                        if((pat(x,y)~=-1)&&(pat(x,y)~=structure(x,y)))
                            continuous=false;                    
                        end    
                        k=k+1;    
                    end
                    if(continuous)
                        skeleton5x5(i,j)=1; %Quitar y ponerlo en blanco 
                    end
                end  
            end
        
        map(3:3+n-1,3:3+m-1)=skeleton5x5;
        end  
        if ((isequal(skeleton5x5,inicial)))
            iguales=true;
        end
    
    end
end
    