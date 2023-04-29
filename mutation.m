function population = mutation(population, N_mutacoes, variables)
    for i= 1:N_mutacoes
      r1 = randi([1 length(population)]);
      r2 = randi([1,length(variables)], 1);
      population(r1).(string(variables(r2)))=round(population(r1).(string(variables(r2)))*(0.5+rand(1)));
    end
return
end