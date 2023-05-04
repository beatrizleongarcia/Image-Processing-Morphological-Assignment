% 1 WHITE, 0 BLACK AND -1 DOES NOT MATTER

function hitmiss3x3=hitmiss3x3(BLACKWHITE,n,m,HITMISSPATTERN)
    hitmiss3x3=ones(n,m);
    map=ones(n+2,m+2); %MARCO
    map(2:2+n-1,2:2+m-1)=BLACKWHITE;

    %definitions to detect the patron
    pat=HITMISSPATTERN(1:3,1:3);
    
    for i=1:n
        for j=1:m
            structure=map(i:i+2,j:j+2);
            k=0;
            continuous=true;
            while(continuous &&(k<9))
                x=fix(k/3)+1;
                y=mod(k,3)+1;
                if((pat(x,y)~=-1)&&(pat(x,y)~=structure(x,y)))
                    continuous=false;                    
                end    
                k=k+1;    
            end
    
            if(continuous)
                hitmiss3x3(i,j)=0; %ponerlo en negro 
            end
        end  
    end
end
