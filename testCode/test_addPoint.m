clearvars

hF = figure(11); clf
hA = axes('parent', hF);
hold(hA, 'on')

N = 100;
y = rand(N, 1);
x = 1:N;

for n = 1:N
    plot(hA, x(n), y(n), '-o')
    pause(0.3)
end