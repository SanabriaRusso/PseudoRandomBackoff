function plotta(AC, schedules)


[sxTxEDCA, intColEDCA, throughputEDCA] = EDCA(AC,schedules);
[sxTxECAHew, intColECAHew, throughputECAHew, totalIterations] = ECA_HEW(AC,schedules);

for i = 1:AC
    sx(i,:) = [sxTxEDCA(i),sxTxECAHew(i)];
    intCol(i,:) = [intColEDCA(i), intColECAHew(i)];
    throughput(i,:) = [throughputEDCA(i), throughputECAHew(i)];
end
   
% h = figure(1);
% bar(sx);
% grid on;
% title('Successful transmissions');
% xlabel('Access Category');
% ylabel('Number of successful transmissions');
% legend('EDCA', 'CSMA/ECA HEW', 'Location', 'best');

i = figure(2);
bar(intCol);
grid on;
title('Internal collisions');
xlabel('Access Category');
ylabel('Number of internal collisions');
legend('EDCA', 'CSMA/ECA HEW', 'Location', 'best');

j = figure(3);
bar(throughput);
grid on;
title('Throughput');
xlabel('Access Category');
ylabel('Throughput');
legend('EDCA', 'CSMA/ECA HEW', 'Location', 'best');

k = figure(4);
bar(totalIterations);
grid on;
title('Average pseudo-random backoff iterations');
xlabel('Node');
ylabel('Avg. Iterations');
legend('CSMA/ECA HEW', 'Location', 'best');





end
