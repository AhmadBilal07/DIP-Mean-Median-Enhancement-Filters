 
 function [ result] = med( B )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

result=zeros(size(B,1),size(B,2));

colform=1;
rowform=1;
rr=2;
rc=2;

for rowb=0:1:(size(B,1)-3)
     for colb=0:1:(size(B,2)-3)
        
        for r=1+rowb:1:(3+rowb)
            for c=1+colb:1:(3+colb)
            temp(rowform,colform)=B(r,c);
            colform=colform+1;
            end;
            rowform=rowform+1;
            colform=1;
        end;
        result(rr,rc)=median(temp(:));
        rowform=1;
        temp=0;
        rc=rc+1;

     end;
     rc=2;
     rr=rr+1;
end;

