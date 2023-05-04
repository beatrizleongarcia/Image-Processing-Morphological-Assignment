% 1 WHITE, 0 BLACK AND -1 DOES NOT MATTER

function skeleton7x7=skeleton7x7(BLACKWHITE,n,m)
    skeleton7x7=BLACKWHITE;
    map=ones(n+6,m+6); %MARCO
    map(4:4+n-1,4:4+m-1)=BLACKWHITE;
    %GOLAY´S ALPHABET
    golay=zeros(7,7,8);
    golay(:,:,1)=[1,1,1,1,1,1,1;1,1,1,1,1,1,1;1,1,1,1,1,1,1;-1,-1,-1,0,-1,-1,-1;0,0,0,0,0,0,0;0,0,0,0,0,0,0;0,0,0,0,0,0,0];
    golay(:,:,2)=[-1,-1,-1,1,1,1,1;-1,-1,-1,1,1,1,1;-1,-1,-1,1,1,1,1;0,0,0,0,1,1,1;0,0,0,0,-1,-1,-1;-1,-1,0,0,-1,-1,-1;-1,-1,0,0,-1,-1,-1];
    golay(:,:,3)=rot90(golay(:,:,1),-1);%-1 PARA ROTAR LA MATRIZ 
    golay(:,:,4)=rot90(golay(:,:,2),-1);
    golay(:,:,5)=rot90(golay(:,:,3),-1);
    golay(:,:,6)=rot90(golay(:,:,4),-1);
    golay(:,:,7)=rot90(golay(:,:,5),-1);
    golay(:,:,8)=rot90(golay(:,:,6),-1);

    iguales=false;
    while (~iguales)  
        inicial=skeleton7x7;
        for s=1:8
            pat=golay(:,:,s);
            for i=1:n
                for j=1:m
                    structure=map(i:i+6,j:j+6);
                    k=0;
                    continuous=true;
                    while(continuous &&(k<49))
                        x=fix(k/7)+1; 
                        y=mod(k,7)+1;
                        if((pat(x,y)~=-1)&&(pat(x,y)~=structure(x,y)))
                            continuous=false;                    
                        end    
                        k=k+1;    
                    end
                    if(continuous)
                        skeleton7x7(i,j)=1; %Quitar y ponerlo en blanco 
                    end
                end  
            end
        
        map(4:4+n-1,4:4+m-1)=skeleton7x7;
        end  
        if ((isequal(skeleton7x7,inicial)))
            iguales=true;
        end
    
    end
end
    