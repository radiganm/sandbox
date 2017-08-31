#!/usr/bin/python
## mlp_predict.py
## Mac Radigan
##
## basd on the Keras documentation at https://keras.io/getting-started/sequential-model-guide/

import keras
from keras.models import load_model
import numpy as np
import os
import pickle as pkl

model_file = os.path.join('mlp_model') + '.h5'
model = load_model(model_file)

data_file = os.path.join('mlp_data') + '.pkl'
data = pkl.load(open(data_file, 'rb'));
x_train = data['x_train']
y_train = data['y_train']
x_test  = data['x_test']
y_test  = data['y_test']
N_in    = data['N_in']
N_out   = data['N_out']

N = np.size(data['x_train'],0)

x_batch = np.zeros((1,N_in),  dtype=float, order='C')
y_batch = np.zeros((1,N_out), dtype=float, order='C')

for n in xrange(0,N):
  x_batch[0,:] = x_test[0,:]
  y_batch[0,:] = y_test[0,:]
  print np.linalg.norm(y_batch - model.predict_on_batch(x_batch))/N_out

## *EOF*
