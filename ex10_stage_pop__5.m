clear

t=1:12;
sealice=1:20;

g1=ones(1,length(sealice));
g2=ones(1,length(sealice));
g3=zeros(1,length(sealice));
g4=zeros(1,length(sealice));
g5=zeros(1,length(sealice));
g6=zeros(1,length(sealice));

v=zeros(6,length(t));
L=zeros(6,6);
M=[1 20 300 800 1400 3000];

S_ee=0.2;               % Probability that eggs survive [egg/egg]
%S_ea=0.7;               % Probability that eggs becomes alevins [egg/alevins]

S_aa=0.2;               % Probability that alevins stay alevins [alevins/alevins]
%S_af=0.8;               % Probability that alevins become fry [alevins/fry]

S_ff=0.15;              % Probability that fry stay fry [Fry/Fry]
%S_fp=0.8;               % Probability that fry become parrs [Fry/Parr]

S_pp=0.1;               % Probability that parrs stay parrs [Parr/Parr]
%S_ps=0.8;               % Probability that parrs become smolts [Parr/Smolt]

S_ss=0.1;               % Probability that smolts stay smolts [Smolt/Smolt]
%S_sa=0.9;               % Probability that smolts become adults [Smolt/Adult]

S_aa1=0.1;              % Probability that adults stay adults [Adult/Adult]
f=9000;                    % How many eggs can an adult can give birth to? [eggs/adults]

for j=1:length(sealice)
    
    g1(j)=g1(j);
    g2(j)=g2(j);
    g3(j)=exp(-0.04*sealice(j));
    g4(j)=exp(-0.05*sealice(j));
    g5(j)=exp(-0.09*sealice(j));
    g6(j)=exp(-0.12*sealice(j));
    
    L=[S_ee-g1(j) 0          0          0          0          f; 
       g1(j)      S_aa-g2(j) 0          0          0          0; 
       0          g2(j)      S_ff-g3(j) 0          0          0; 
       0          0          g3(j)      S_pp-g4(j) 0          0; 
       0          0          0          g4(j)      S_ss-g5(j) 0; 
       0          0          0          0          g5(j)      S_aa1-g6(j)];
      
   [w,lambda]=eig(L);
   lambda_max=min(max(lambda));
   [row,col]=find(lambda==lambda_max);
   eigenvector=w(:,col);
   
   for i=1:length(t)
   
    v(:,i)=L*eigenvector;
    eigenvector=v(:,i);
    
%     figure(1)
%     clf(1)
%     plot(sealice,g1)
%     hold on
%     plot(sealice,g2)
%     plot(sealice,g3)
%     plot(sealice,g4)
%     plot(sealice,g5)
%     plot(sealice,g6)
%     hold off
%     title('Growth rates')
%     xlabel('Sealice abundancy')
%     ylabel('Growth rate')
%     legend('Eggs','Alevins','Fry','Parr','Smolts','Adults')
%     
%     
%     
%     figure(2)
%     clf(2)
%     plot(t,v(1,:))
%     hold on
%     plot(t,v(2,:))
%     plot(t,v(3,:))
%     plot(t,v(4,:))
%     plot(t,v(5,:))
%     plot(t,v(6,:))
%     hold off
%     title('Population abundancy')
%     set(gca,'xtick',1:12,...
%     'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
%     ylabel('Number of individuals')
%     legend('Eggs','Alevins','Fry','Parr','Smolts','Adults')
%     
%     figure(3)
%     clf(3)
%     semilogy(t,v(1,:))
%     hold on
%     semilogy(t,v(2,:))
%     semilogy(t,v(3,:))
%     semilogy(t,v(4,:))
%     semilogy(t,v(5,:))
%     semilogy(t,v(6,:))
%     hold off
%     title('Population abundancy in logaritmic scale')
%     set(gca,'xtick',1:12,...
%     'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
%     ylabel('Number of individuals')
%     legend('Eggs','Alevins','Fry','Parr','Smolts','Adults')
        
   end

end

biomass=sum(v(:,end).*M');