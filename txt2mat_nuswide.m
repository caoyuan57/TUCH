% clear
% %npy to txt
% 
% str = '.\Results\nuswide\';
% str1 = '.\Results\nuswide\tuch_nuswide_i2t';
% str2 = '.\Results\nuswide\tuch_nuswide_t2i';
% 
% recallbits=[1:1000:184577];
% 
% num_bits = 1;
% 
% % map_name=strcat(str,'map.txt');
% % mAP=load(map_name);
% 
% %Image to text
% i=0;
% for nb = [64]
%     i = i + 1;
%     disp(i);
%     test_name=strcat(str,num2str(nb),'-tst_img_binary.txt');
%     Btest=load(test_name);
%     Btest=Btest>0;
%     Bt=compactbit(Btest);
%     
%     base_name=strcat(str,num2str(nb),'-db_txt_binary.txt');
%     Bbase=load(base_name);
%     Bbase=Bbase>0;
%     Bb=compactbit(Bbase);
%     
%     base_label=strcat(str,num2str(nb),'-db_label.txt');
%     baseLabel=load(base_label);
%     
%     test_label=strcat(str,num2str(nb),'-tst_label.txt');
%     testLabel=load(test_label);
%     
%     %label to value
%     bLabel=zeros(18015,24);
%     qLabel=zeros(2000,24);
%     for k = 1:size(baseLabel,1)
%         a=find(baseLabel(k,:)~=0);
%         bLabel(k,1:size(a,2))=a;
%     end
%     for k = 1:size(testLabel,1)
%         a=find(testLabel(k,:)~=0);
%         qLabel(k,1:size(a,2))=a;
%     end
%     
%     %Computing Hamming Distance
%     hamm = hammingDist(Bt, Bb);
%     
%     %Evaluating Precision and Recall and mAP 
%     [tuch_map(1,i),tuch_precision(:,i),tuch_recall(:,i)] = evaluation_nuswide(hamm,qLabel,bLabel,recallbits);
%    
% end
% 
% map_dir=[str1,'_map.mat'];
% save(map_dir,'tuch_map');
% precision_dir=[str1,'_precision.mat'];
% save(precision_dir,'tuch_precision');
% recall_dir=[str1,'_recall.mat'];
% save(recall_dir,'tuch_recall');
% 
% %Text to image
% i=0;
% for nb = [64]
%     i = i + 1;
%     disp(i);
%     test_name=strcat(str,num2str(nb),'-tst_txt_binary.txt');
%     Btest=load(test_name);
%     Btest=Btest>0;
%     Bt=compactbit(Btest);
%     
%     base_name=strcat(str,num2str(nb),'-db_img_binary.txt');
%     Bbase=load(base_name);
%     Bbase=Bbase>0;
%     Bb=compactbit(Bbase);
% 
% %     base_label=strcat(str,num2str(nb),'-db_label.txt');
% %     baseLabel=load(base_label);
% %     
% %     test_label=strcat(str,num2str(nb),'-tst_label.txt');
% %     testLabel=load(test_label);
% %     
% %     %label to value
% %     bLabel=zeros(18015,24);
% %     qLabel=zeros(2000,24);
% %     for k = 1:size(baseLabel,1)
% %         a=find(baseLabel(k,:)~=0);
% %         bLabel(k,1:size(a,2))=a;
% %     end
% %     for k = 1:size(testLabel,1)
% %         a=find(testLabel(k,:)~=0);
% %         qLabel(k,1:size(a,2))=a;
% %     end
%         
%     %Computing Hamming Distance
%     hamm = hammingDist(Bt, Bb);
%     
%     %Evaluating Precision and Recall and mAP 
%     [ucmh_map(1,i),ucmh_precision(:,i),ucmh_recall(:,i)] = evaluation_nuswide(hamm,qLabel,bLabel,recallbits);
%    
% end

map_dir=[str2,'_map.mat'];
save(map_dir,'tuch_map');
precision_dir=[str2,'_precision.mat'];
save(precision_dir,'tuch_precision');
recall_dir=[str2,'_recall.mat'];
save(recall_dir,'tuch_recall');
