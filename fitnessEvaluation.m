function population = fitnessEvaluation(population, target)
  for i = 1:length(population)
    errorCurrent = population(i).current - target.current;
    errorVoltage = population(i).voltage - target.voltage;
    errorTotal = errorCurrent^2+errorVoltage^2;
    population(i).fitness = 1 / ( 1 + errorTotal );
  end
return
end