% 1 WHITE, 0 BLACK AND -1 DOES NOT MATTER

function hitmiss7x7=hitmiss7x7(BLACKWHITE,n,m,HITMISSPATTERN)
    hitmiss7x7=ones(n,m);
    map=ones(n+6,m+6); %MARCO
    map(4:4+n-1,4:4+m-1)=BLACKWHITE;

    %definitions to detect the patron
    pat=HITMISSPATTERN(1:7,1:7);
    
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
                hitmiss7x7(i,j)=0; %ponerlo en negro 
            end
        end  
    end
end
