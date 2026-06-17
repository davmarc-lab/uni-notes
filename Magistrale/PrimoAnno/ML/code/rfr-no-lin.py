forest_reg = RandomForestRegressor(n_estimators = 30)
forest_reg.fit(xtrain, ytrain)
ytrain_predicted = forest_reg.predict(xtrain)
...
