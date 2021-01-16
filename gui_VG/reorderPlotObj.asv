function reorderPlotObj(hA)

ch = hA.Children;

for n = 1:length(ch)
    tag{n} = ch(n).Tag;
    if strcmp(tag{n}, 'avgLine')
        idx1 = n;
    end
end

hA.Children = ch([idx1 1:idx1-1 idx1+1:length(ch)]);

