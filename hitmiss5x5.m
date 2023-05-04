% 1 WHITE, 0 BLACK AND -1 DOES NOT MATTER

function hitmiss5x5=hitmiss5x5(BLACKWHITE,n,m,HITMISSPATTERN)
    hitmiss5x5=ones(n,m);
    map=ones(n+4,m+4); %MARCO
    map(3:3+n-1,3:3+m-1)=BLACKWHITE;

    %definitions to detect the patron
    pat=HITMISSPATTERN(1:5,1:5);
    
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
                hitmiss5x5(i,j)=0; %ponerlo en negro 
            end
        end  
    end
end
