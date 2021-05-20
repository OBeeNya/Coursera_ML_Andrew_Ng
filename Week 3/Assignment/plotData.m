function plotData(X, y)

figure; hold on;

admitted=find(y==1);
notadmitted=find(y==0);

plot(X(admitted,[1]),X(admitted,[2]), 'LineStyle','none','Marker','o');
plot(X(notadmitted,[1]),X(notadmitted,[2]),'LineStyle', 'none', 'Marker','*');

hold off;

end
