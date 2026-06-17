xtrain_b = np.c_[np.ones((xtrain.shape[0], 1)), xtrain]
xtest_b = np.c_[np.ones((xtest.shape[0], 1)), xtest]
beta_star = np.linalg.inv(xtrain_b.T.dot(xtrain_b)).dot(xtrain_b.T).dot(ytrain)
ytrain_predicted = xtrain_b.dot(beta_star)

