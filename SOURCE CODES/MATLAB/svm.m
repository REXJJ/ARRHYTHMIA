%changenan
%corelation
%datasimplify
%datareduce
clear all;
lambda=0.0001;
A=csvread('new_data.csv');
[r,c]=size(A);
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
                Y(j)=-1;
            end;
        end;
    for i=1:c
        B(i)=0;
    end;
    C=0;
    for k=1:100
        for j=1:r
            Z=Y(j)+B(1)*X(j,1);
            for i=2:c-1
                Z=Z+B(i)*X(j,i);
            end;
            Z=Z+C;
           if(Z>=1)
            for i=1:c-1
                
                B(i)=B(i)*(1-1/j);
                
            end;
            C=C*(1-1/j);
                B(c)=C;
           
           elseif(Z<1)
               for i=1:c-1
                
                B(i)=B(i)*(1-1/j)+1/(lambda*j)*(Y(j))*(X(j,i));
                
            end;
            C=C*(1-1/j)+1/(lambda*j)*(Y(j));
                
                B(c)=C;
           end;
           
        end;
    end;
    
   for i=1:c
        L(l,i)=B(i);
    end;
    Y=T;
    end;
   

csvwrite('svm.csv',L);
