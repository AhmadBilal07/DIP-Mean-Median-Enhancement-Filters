
function[result]=convolutionize(B,M)

temp=0;
colform=1;
rowform=1;
rr=2;
rc=2;
result=zeros(size(B,1),size(B,2));
B=double(B);
for rowb=0:1:(size(B,1)-size(M,1))
     for colb=0:1:(size(B,2)-size(M,2))
        
        for r=1+rowb:1:(size(M,1)+rowb)
            for c=1+colb:1:(size(M,2)+colb)
            temp=temp+B(r,c)*M(rowform,colform);
            colform=colform+1;
            end;
            rowform=rowform+1;
            colform=1;
        end;
        result(rr,rc)=(temp);
        %disp(temp);
        rowform=1;
        temp=0;
        rc=rc+1;

     end;
     rc=2;
     rr=rr+1;
end;



