function population = crossover(parents, variables)
  population(1).r1 = parents(1).r1;
  population(1).r2 = parents(1).r2;
  population(2).r1 = parents(2).r1;
  population(2).r2 = parents(2).r2;
  
  for i = 2:ceil(length(parents))
      mascara = logical(randi([0, 1], 1, length(variables)));
      r1 = randi([2 length(parents)]);
      r2 = randi([2 length(parents)]);
      for j = 1:length(variables)
          if mascara(j)
              population(2*i-1).(string(variables(j)))=parents(r1).(string(variables(j)));
              population(2*i).(string(variables(j)))=parents(r2).(string(variables(j)));
          else
              population(2*i-1).(string(variables(j)))=parents(r1).(string(variables(j)));
              population(2*i).(string(variables(j)))=parents(r2).(string(variables(j)));
          end
      end
  end
return
end