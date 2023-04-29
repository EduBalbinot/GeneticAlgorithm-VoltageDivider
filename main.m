clear, clc
N_POP = 9;
variables = {'r1'; 'r2'};
generation = 0;
fitnessTotal = 0; 
fitnnesAverage = 0;
fitnessGraph = [];
target.voltage = 5;
target.current = 0.02;
simulation= 'TD';

population = initialPopulation(N_POP, variables);

fprintf('Initial Population: \n');
  for i = 1:length(population)
      fprintf('  candidate: %d \n',i);
      disp(population(i))
  end
  
 while fitnnesAverage<=0.9
  for i = 1:N_POP
    disp(i)
    for j = 1:length(variables)
        eval(strjoin([upper(variables(j)) ' = ' num2str(population(i).(string(variables(j)))) ';']));
    end
    simOut = sim(simulation, 'StopTime', '0.1');
    population(i).current= simOut.y(1);
    population(i).voltage= simOut.y(2);
  end

  population = fitnessEvaluation(population, target);
  parents =  fittestCandidates(population);
  
  fitnessTotal = 0;
  for i = 1:length(population)
      fprintf('  candidate: %d \n',i);
      fitnessTotal = fitnessTotal + population(i).fitness;
       disp(population(i));
  end
  
  
  fitnnesAverage = fitnessTotal/length(population)
  fitnessGraph=[fitnessGraph ;generation fitnnesAverage];
  population = crossover(parents, variables);
  population = mutation(population, 2, variables);
  plot(fitnessGraph(:,1), fitnessGraph(:,2))
  generation = generation + 1;
end

population;
generation = generation - 1
plot(fitnessGraph(:,1), fitnessGraph(:,2))
xlim([0 generation])