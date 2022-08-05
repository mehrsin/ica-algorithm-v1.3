clc
clear

ir=0.18;
MAXTON=10000;
L=[2738 2734 2730 2726 2722 2718];
S0=[5453 7564 7563 7562 7567 7200];
N=numel(L);
A0=xlsread('BM-totalZnPb-1054.xlsx');
A0=A0(:,[3 4 5 20 26 2]);
nrt=size(A0,1)
A0=[A0 [1:nrt]' ];

for s=1:N
    S(1,s)=A0(find(A0(:,6)==S0(s)),end);
end
S

M=zeros(nrt);

for i=1:N
    a=find(A0(:,3)==L(i));
    A{i}=A0(a,:);
    I{i}=a;
    
    B=A{i};
    nr=size(B,1);
    
    for r=1:nr-1
        for rr=r+1:nr
              a1=B(r,end);a2=B(rr,end);

            if B(r,1)==B(rr,1) && abs(B(r,2)-B(rr,2))<=5
                M(a1,a2)=1;M(a2,a1)=1;
            end
            
            if B(r,2)==B(rr,2) && abs(B(r,1)-B(rr,1))<=10
                M(a1,a2)=1;M(a2,a1)=1;
            end            
            
        end    
    end
    
    
end
fm=find(M==1);


nvar=numel(fm);


save data