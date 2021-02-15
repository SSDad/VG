clearvars

ffn{1} = 'data_MRN-Mrn1234567_Fraction-1_DT-20210113-142422-145655_TE_1953.mat';
ffn{2} = 'data_MRN-Mrn202101_Fraction-1_DT-20210118-090323-091507_TE_702';
ffn{3} = 'data_MRN-Mrn202101_Fraction-2_DT-20210118-091655-092650_TE_595';

for n = 1:3
    load(ffn{n});
    pps = 20;
%     yy = yy-baseLine;

    save(ffn{n}, 'pps', 'yy', 'tt', 'baseLine')
end