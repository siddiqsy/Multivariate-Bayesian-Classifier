
%% Case 1:
training = F1(1:100,1:5);

s1 = std(training);

m1 = mean(training);

T1 = F1(101:1000,:);
Z1=zeros(900,5,5);
for i=1:900
    for j=1:5
        for k=1:5
            Z1(i,j,k)=(T1(i,j)-m1(k))/s1(k);
        end
    end
    
end

P1 = normpdf(Z1);

class = zeros(900,5);

count=0;

for i=1:900
    for j=1:5
        class(i,j) = find(P1(i,j,:)==max(P1(i,j,:)));
        if (class(i,j)==j)
            count=count+1;
        end
    end
end

accuracy = count/4500;
% 0.5262
Z1  = F1;
for i=1:1000
    m1=mean(F1(i,:));
    s1=std(F1(i,:));
    Z1(i,:) = (F1(i,:)-m1)/s1;
end


figure; 
hold on;
for i = 1:5
scatter(Z1(:,i),F2(:,i),[10],'filled')
end
legend('c1','c2','c3','c4','c5');
title('Plot for Z1 and F2');
xlabel('Z1');
ylabel('F2');

%% Case 2:
training = Z1(1:100,1:5);

s1 = std(training);

m1 = mean(training);

T1 = Z1(101:1000,:);
z1=zeros(900,5,5);
for i=1:900
    for j=1:5
        for k=1:5
            z1(i,j,k)=(T1(i,j)-m1(k))/s1(k);
        end
    end
    
end

PZ1 = normpdf(z1);

class = zeros(900,5);

count=0;

for i=1:900
    for j=1:5
        class(i,j) = find(PZ1(i,j,:)==max(PZ1(i,j,:)));
        if (class(i,j)==j)
            count=count+1;
        end
    end
end

accuracyZ1 = count/4500;
% 0.8838

%% Case 3:

training = F2(1:100,1:5);

s1 = std(training);

m1 = mean(training);

T2 = F2(101:1000,:);
z2=zeros(900,5,5);
for i=1:900
    for j=1:5
        for k=1:5
            z2(i,j,k)=(T2(i,j)-m1(k))/s1(k);
        end
    end
    
end

P2 = normpdf(z2);

class = zeros(900,5);

count=0;

for i=1:900
    for j=1:5
        class(i,j) = find(P2(i,j,:)==max(P2(i,j,:)));
        if (class(i,j)==j)
            count=count+1;
        end
    end
end

accuracy2 = count/4500;
% 0.5351

%% Case 4:

PZ12 = PZ1.*P2;

class = zeros(900,5);

count=0;

for i=1:900
    for j=1:5
        class(i,j) = find(PZ12(i,j,:)==max(PZ12(i,j,:)));
        if (class(i,j)==j)
            count=count+1;
        end
    end
end

accuracyZ12 = count/4500;
% 0.9784

