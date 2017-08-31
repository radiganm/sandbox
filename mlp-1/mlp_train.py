#!/usr/bin/python
## mlp_train.py
## Mac Radigan
##
## basd on the Keras documentation at https://keras.io/getting-started/sequential-model-guide/

import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation
from keras.optimizers import SGD
import numpy as np
import os
import pickle as pkl

N_in  = 20
N_out = 10

# Generate dummy data
x_train = np.random.random((1000, N_in))
y_train = keras.utils.to_categorical(np.random.randint(10, size=(1000, 1)), num_classes=10)
x_test = np.random.random((100, N_in))
y_test = keras.utils.to_categorical(np.random.randint(10, size=(100, 1)), num_classes=10)

model = Sequential()
# Dense(64) is a fully-connected layer with 64 hidden units.
# in the first layer, you must specify the expected input data shape:
# here, 20-dimensional vectors.
model.add(Dense(64, activation='relu', input_dim=N_in))
model.add(Dropout(0.5))
model.add(Dense(64, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(N_out, activation='softmax'))

sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)
model.compile(loss='categorical_crossentropy',
              optimizer=sgd,
              metrics=['accuracy'])

model.fit(x_train, y_train,
          epochs=N_in,
          batch_size=128)
score = model.evaluate(x_test, y_test, batch_size=128)

model_file = os.path.join('mlp_model') + '.h5'
model.save(model_file, overwrite=True)

data_file = os.path.join('mlp_data') + '.pkl'
pkl.dump(
  {
    'N_in':    N_in, 
    'N_out':   N_out, 
    'x_train': x_train, 
    'y_train': y_train, 
    'x_test':  x_test, 
    'y_test':  y_test 
  }, open(data_file, 'wb'))


## *EOF*
