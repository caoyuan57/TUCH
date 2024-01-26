function [map, precision1, recall] = evaluation_flickr(Dhat,qLabel,bLabel,recallbits)

num_query = size(qLabel,1);
num_base = size(bLabel,1);

tf=zeros(num_query,num_base);
disp('computing tf...');
for i = 1:num_query
    disp(i);
    [~,Coords(1,:)] = sort(Dhat(i,:),2);
    temp=qLabel(i,:);
    temp(temp==0)=[];
    for j = 1:num_base
        if(~isempty(intersect(temp,nonzeros(bLabel(Coords(1,j),:)))))
            tf(i,j)=1;
        end
    end
end

precision = zeros(num_query,1);
tf_sum=sum(sum(tf,2));
recall =zeros(size(recallbits,2),1);
i=0;
m=0;
for k=recallbits
    i=i+1;
    disp(i);
    m=m+1;
    recall(i,1)=sum(sum(tf(:,1:k),2))/tf_sum;
    
    for j = 1:num_query
        rt_num = find(tf(j,1:k)~=0);
        if isempty(rt_num)
            precision(j,1) = 0;
        else
            tr_num = [1:size(rt_num,2)];
            precision(j,m) =sum(tr_num./rt_num)/size(rt_num,2);
        end
    end
end
precision=mean(precision,1);
precision1=precision';

precision_new=zeros(num_query,1);
i=0;
m=0;
for k=50%size(bLabel,1)
    i=i+1;
    m=m+1;
    for j = 1:num_query
        rt_num = find(tf(j,1:k)~=0);
        if isempty(rt_num)
            precision_new(j,1) = 0;
        else
            tr_num = [1:size(rt_num,2)];
            precision_new(j,m) =sum(tr_num./rt_num)/size(rt_num,2);
        end
    end
end

map=mean(precision_new(:));

