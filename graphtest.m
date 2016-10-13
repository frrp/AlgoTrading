x = [0:1:100];
y = (sin(x)).^2;
y1 = sqrt(x);
hold on;
h1 = plot(x,y1);
h2 = plot(x,y);
hold off;
grid on;
delete h1;