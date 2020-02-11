function [out1,out2]  = findCriticalPoints( signIn )



y=signIn;
L=length(y)-5;
i=2;

e=1;
beginning(1)=1;
b=2;
while(i<L)
    if(y(i)==0)
        flag1=true;
        flag2=true;
        for(j=i-5:i-1)
            if(y(j)~=0)
                flag1=false;
            end
        end
        for(j=i+1:i+5)
            if(y(j)==0)
                flag1=false;
            end
        end
        if(flag1 && flag2)
            beginning(b)=i+1;
            b=b+1;
        end
    end
    
    if(y(i)==0)
        flag1=true;
        flag2=true;
        for(j=i-5:i-1)
            if(y(j)==0)
                flag1=false;
            end
        end
        for(j=i+1:i+5)
            if(y(j)~=0)
                flag1=false;
            end
        end
        if(flag1 && flag2)
            ending(e)=i-1;
            e=e+1;
        end
    end
    
    i=i+1;
end
if(e~=b)
    ending(e)=length(y);
end

out1=beginning ;
out2=ending ;

end

