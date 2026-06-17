lin_reg = LinearRegression()
lin_reg.fit(xtrain, ytrain)
ytrain_predicted = lin_reg.predict(xtrain)
rmse = np.sqrt(mean_squared_error(ytrain, ytrain_predicted))
print('Train RMSE: ', rmse)
ytest_predicted = lin_reg.predict(xtest)
rmse = np.sqrt(mean_squared_error(ytest, ytest_predicted))
print('Test RMSE: ', rmse)

