function  imp=imperialistic_competition(imp)

nimp=length(imp);

if nimp>=2
[~,index1]=max([imp.totalfit]);
wimp=imp(index1);

[~,index2]=max([wimp.colony.fit]);
wcolony=wimp.colony(index2);


imp(index1).colony=imp(index1).colony([1:index2-1 index2+1:end]);


P=[imp.totalfit];
P(index1)=0;
P=max(P)-P+eps;
k=RouletteWheel(P);

n=length(imp(k).colony);
imp(k).colony(n+1).x=wcolony.x;
imp(k).colony(n+1).fit=wcolony.fit;
imp(k).colony(n+1).info=wcolony.info;



n=length(imp(index1).colony);

if n==0
    
imp=imp([1:index1-1 index1+1:end]);
P=[imp.totalfit];
P=max(P)-P+eps;
k=RouletteWheel(P);

n=length(imp(k).colony);
imp(k).colony(n+1).x=wimp.x;
imp(k).colony(n+1).fit=wimp.fit; 
imp(k).colony(n+1).info=wimp.info; 
    
    
end





end






end







