
				MATLAB Code for Prediction of Urban Scenarios' LOS Behavior using Neural Networks



Folder Structure of Matlab Code
===================================

	00_data									// new training data should be stored here	
		01_scenarios						// scenarios in osm and sumo formats
			osm
			sumo
		02_LOSprobabilities					// target data (for supervised learning) line-of-sight probabilites
	01_convert_osm-sumo					
		>> scriptConversion.m <<			// script for conversion of osm files to sumo files (net.xml, poly.xml) under 00_data\01_scenarios
	02_calculate_scenarioAttributes
		01_read_coordinates
		02_compute_attributes
		>> scriptCalculateAttributes.m <<	// script for calculation of scenario attributes from net.xml and poly.xml stored in 00_data\01_scenarios\sumo
	03_create_trainingData
		>> create_trainingData_FFnet.m <<	// script to preprocess input and target data for the training of a FFNN, stores it in 04_training
		>> create_trainingData_RBFnet.m <<	// script to preprocess input and target data for the training of a RBFNN, stores it in 04_training
		>> scenario_attributes.mat <<		// scenario attributes updated by scriptCalculateAttributes.m in 02_calculate_scenarioAttributes
	04_training
		00_initial_trainingData				// data used for initial training is stored here
		>> train_FFnet.m <<					// script for training a feed forward neural network
		>> train_RBFnet.m <<				// script for training a radial basis function neural network
		>> FFnet.mat <<						// training result: feed forward neural network
		>> RBFnet.mat <<					// training result: radial basis function neural network
		
		
		
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



Accompanying code for the paper "A Stochastic V2V LOS/NLOS Model Using Neural Networks for Hardware-In-The-Loop Testing",
presented at IEEE VNC 2017 by Christina Stadler (christina1.stadler@audi.de)