function parents =  fittestCandidates(population)
  [~, indices] = sort([population.fitness],'descend');
  orderedPopulation = population(indices);
  parents = orderedPopulation(1:ceil(length(population)/2));
return