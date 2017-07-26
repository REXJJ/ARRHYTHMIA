%changenan
%corelation
%datasimplify
%datareduce
clear all;
c=14;
r=400;
A=csvread('new_data.csv');
for i=1:r

    for j=1:c-1
    X(i,j)=A(i,j);
    end;
end;
    Y=A(:,c);
    T=Y;
    for l=1:1
        for j=1:r
            if(Y(j)==l)
                Y(j)=1;
       
            elseif(Y(j)~=l)
                Y(j)=0;
            end;
        end;
        
    for i=1:c
        B(i)=0;
    end;
    C=0;
    for k=1:1
        for j=1:r
            Z=0;
            for i=1:c-1
                Z=Z+B(i)*X(j,i);
            end;
            Z=Z+C;
            p=1/(1+exp(-Z));
            for i=1:c-1
                
                B(i)=B(i)+0.3*(Y(j)-p)*(p)*(1-p)*(X(j,i));
                
            end;
            C=C+0.3*(Y(j)-p)*(p)*(1-p);
                B(c)=C;
        end;
    end;
    
   for i=1:c
        L(l,i)=B(i);
    end;
    %Y=T;
    end;
   

csvwrite('logistic.csv',L);
