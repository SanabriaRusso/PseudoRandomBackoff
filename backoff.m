function [newCounter, iterations] = backoff(i,counters, stages, CWmin)
    
    AC = length(counters);
    futureCycles = ones(1,AC);
    ACs = 1:AC;
    match = 0;
    iterations = 0;
    
    
    newCounter = randi(2^stages(i)*CWmin(i));
    for j = ACs
        if(j ~= i)
            futureCycles(j) = mod( abs((2^stages(j)*CWmin(j)) - newCounter), min((2^stages(j)*CWmin(j)), newCounter) );
        end
    end
    
    %Checks if there are other newCounter values in the counters vector
    %or the futureCycles.
     compareBackoffs = newCounter == counters;
     compareCycles = match == futureCycles;
    
     while ( (any(compareBackoffs) == 1) || (any(compareCycles) == 1) )
         fprintf('Failed with: %i\n', newCounter);
         iterations = iterations + 1;
         newCounter = randi(2^stages(i)*CWmin(i));
         compareBackoffs = newCounter == counters;
         futureCycles = ones(1,AC);
         for j = ACs
             if(j ~= i)
                futureCycles(j) = mod( abs((2^stages(j)*CWmin(j)) - newCounter), min((2^stages(j)*CWmin(j)), newCounter) );
             end
         end
         compareCycles = match == futureCycles;
     end
     
%     fprintf('New backoff: %i\n', newCounter);

end