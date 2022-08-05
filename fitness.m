function sol=fitness(sol,data)

%% Calling Data
load data
%% Calling Sol
x=sol.x;
x=CB(x,0,1);
MM=M;
X=M;X(fm)=x;

y=1;mo=1;NPV=0;CH=0;
tonm=MAXTON;O=[];

for l=1:N
    
    s=S(l);us=[];
    ai=I{l};ai=ai'; Ai=A{l};
    
    smi=sum(MM,2)';
    
            i=s;
   j=find(Ai(:,end)==i);lx=[Ai(j,1) Ai(j,1)];ly=[Ai(j,2) Ai(j,2)];
  
  [Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=CAL1(Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l);       
    
    
    while ~isempty(ai)
        %as=find(M(s,:)==1);
        
        [v,bs]=sort(X(s,:));
        bs(v==0)=[];a1=bs;
        
        for i=bs
            
  [Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=CAL1(Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l);       
            
        end
        
        ai(ai==s)=[];[us]=[us s];s=0;
        
      [ai,Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=REMOVEai(ai,Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l);

        
        if isempty(ai);break;end
        
        for k=a1
            if sum(X(k,:))>0
                s=k;break;
            end
        end
        
        if s==0
            

        
                val=0;
                a3=sum(MM,2)'-smi;
                [val0,ind]=sort(a3);
                
                for k=1:numel(ind)
                    ik=ind(k);
                    if ismember(ik,ai) && val0(k)<0
                        s=ik;val=val0(k);break;
                    end
                end


                
               if val==0

                
                a5=sum(X);[val,ind]=sort(a5,'descend');
                ind(val==0)=[];ind=intersect(ind,ai,'stable');
                if ~isempty(ind);s=ind(1);end
 
               end
            
             if s>0 && ~ismember(s,O(:,1))  
             [Ai,s,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=CAL1(Ai,s,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l);       
             end
             
             if s==0;CH=100000;end
        
        end
        
        if CH>0;break;end
        
    end

   
    
    
          if CH>0;break;end
 
    
end


SCH=1000*sum(CH);

%% Cal OBJ

fit0=1/NPV;



sol.fit=fit0+(1*SCH);
sol.info.x=x;
sol.SCH=SCH;
sol.info.SCH=SCH;
sol.info.CH=CH;
sol.info.fit0=fit0;
sol.info.fit0=fit0;
sol.info.O=O;
sol.info.y=y;
sol.info.mo=mo;
sol.info.NPV=NPV;


end

function [ai,Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=REMOVEai(ai,Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l)

        Q1=[];
        for k=1:numel(ai)
            if sum(MM(ai(k),:))==0
                [Q1]=[Q1 k];
                i=ai(k);
                if ~ismember(i,O(:,1))
                [Ai,i,i,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=CAL1(Ai,i,i,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l);       
                end
            end
        end
        ai(Q1)=[];
end

function [Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly]=CAL1(Ai,i,s,MAXTON,tonm,mo,y,O,NPV,X,MM,lx,ly,ir,l)
            
            OKK=0;
            X(s,i)=0;X(i,s)=0;MM(s,i)=0;MM(i,s)=0;
            
            if isempty(O)
                OKK=1;
            else
                O1=O(:,1);
                if ~ismember(i,O1);OKK=1;end
                
            end
            
            if OKK==1
            j=find(Ai(:,end)==i);
            toni=Ai(j,4);
            ben=Ai(j,5);
            if toni>tonm
            [O]=[O;[i Ai(j,6) l y mo tonm ben 0 nan]];
            toni=toni-tonm;    
            tonm=MAXTON;mo=mo+1;
            if mo==13;y=y+1;mo=1;end
            end
            
            tonm=tonm-toni;
            npv=ben/((1+ir)^y);
            [O]=[O;[i Ai(j,6) l y mo toni ben tonm npv]];
            NPV=NPV+npv;  
            if Ai(j,1)<lx(1);lx(1)=Ai(j,1);end
            if Ai(j,1)>lx(2);lx(2)=Ai(j,1);end
            if Ai(j,2)<ly(1);ly(1)=Ai(j,2);end
            if Ai(j,2)>ly(2);ly(2)=Ai(j,2);end 
            end
            
end

