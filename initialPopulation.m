function population = initialPopulation(N_POP, variables)
    population = [];
    for i = 1:N_POP
        for j = 1:length(variables)
            population(i).(string(variables(j))) = randi([0, 1000]);
            % debug:
            % population(i).(string(VARIABLES(j))) = j + i*10 + randi([0, 9])*100;
        end
    end
return
end