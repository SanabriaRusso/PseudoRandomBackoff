function [sxTx, intCol, throughput] = EDCA(AC, schedules)
  
    maxStage = 5;
    
    Backoff = zeros(1,AC);
    Stages = Backoff;
    CWmin = [8, 16, 32, 32];
    
    if AC > 4
        for i = 5:AC
            CWmin = [CWmin 32];
        end
    end
    
    sxTx = zeros(1,AC);
    intCol = zeros(1,AC);
    
    %Filling the backoff matrix
    for i = 1:AC
        Backoff(i) = randi(2^Stages(i)*CWmin(i));
    end
    
    s = 0;
    throughput = zeros(1,AC);
    while s < schedules
        tx = AC + 1; %a big and out-of-range value
        decrement = AC;
        for i = 1:AC
            if Backoff(i) == 0
                if i <= tx 
                    tx = i;
                    decrement = decrement - 1;
                    Stages(i) = 0;
                    Backoff(i) = randi(2^Stages(i)*CWmin(i));
                else
                    Stages(i) = min(Stages(i)+1,maxStage);
                    intCol(i) = intCol(i) + 1;
                    Backoff(i) = randi(2^Stages(i)*CWmin(i));
                end
            end
        end
        if(decrement == AC)
            Backoff = Backoff - 1;  %substract 1 from all array elements
        else
            sxTx(tx) = sxTx(tx) + 1;            
        end
        s = s + 1;
    end
    
    %Throughput metrics
    L = 1024 * 8;
    for i =1:AC
        throughput(i) = L*sxTx(i);
    end
    
end