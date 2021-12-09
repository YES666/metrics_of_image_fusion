function output=mainf(files,source1,source2,position,path_excel)
result = zeros(15*length(files),1);
for i  = 1:length(files)
    fileName_fused = [files(i).folder '\' files(i).name];
    %fileName_fused = ['Z:\DARTS\augments\train\' files(i).name];
    fileName_source_ir  = [source1,files(i).name];
    fileName_source_vis = [source2,files(i).name];

    source_image1 = imread(fileName_source_ir);
    source_image2 = imread(fileName_source_vis);
    fused_image   = imread(fileName_fused);
    
    t1=clock;
    disp("Start");
    disp('---------------------------Analysis---------------------------');
    output = analysis_Reference1(fused_image,source_image1,source_image2);
    disp(['Done',num2str(i)]);
    t2=clock;
    etime(t2,t1)
    result((i-1)*15+1:i*15) = output;
end
xlswrite(path_excel,result,1,[position '2']);

