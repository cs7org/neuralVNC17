
				MATLAB Code for Prediction of Urban Scenarios' LOS Behavior using Neural Networks



Folder Structure of Matlab Code
===================================

	00_data									// new training data should be stored here	
		02_LOSprobabilities					// target data (for supervised learning)
	02_calculate_scenarioAttributes
		01_read_coordinates
		02_compute_attributes
		>> scriptCalculateAttributes.m <<	// script for calculation of scenario attributes via net.xml and poly.xml stored in 00_data\01_scenarios\sumo
	03_create_trainingData
		>> create_trainingData_FFnet.m <<	// script to preprocess data for the training of a FFNN
		>> create_trainingData_RBFnet.m <<	// script to preprocess data for the training of a RBFNN
		>> scenario_attributes.mat <<		// scenario attributes updated by scriptCalculateAttributes.m
	04_training
		00_initial_trainingData				// data used for initial training is stored here
		>> train_FFnet.m <<					// script for the training of a feed forward neural network
		>> train_RBFnet.m <<				// script for the training of a radial basis function neural network
		>> trainingData_FFnet.mat <<		// data used for training started by train_FFnet.m and upadted by create_trainingData_FFnet.m
		>> trainingData_RBFnet.mat <<		// data used for training started by train_RBFnet.m and upadted by create_trainingData_RBFnet.m
		
		
		
ToDos prior to usage - MANDATORY
===================================

Prior to usage of the code your folder path must be specified in the following scripts:
	- scriptConversion.m
	- scriptCalculateAttributes.m
	- create_trainingData_FFnet.m
	- create_trainingData_RBFnet.m
	- train_FFnet.m
	- train_RBFnet.m
	
	
	
License
===================================
This code is licensed under GNU Lesser GPL Version 3.