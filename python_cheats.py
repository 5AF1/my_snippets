import random
import numpy as np
import tensorflow as tf
import torch
import sklearn
import pandas as pd
import os
import scipy

# Set the seed for all libraries
seed = 42

random.seed(seed)
np.random.seed(seed)
tf.random.set_seed(seed)
torch.manual_seed(seed)
torch.cuda.manual_seed_all(seed)
sklearn.utils.check_random_state(seed)
pd.set_option('use_numpy_random', True)
np.random.seed(seed)

# Note: scipy uses the same random number generator as numpy,
# so setting the seed for numpy should be enough.
# However, some scipy functions may use other libraries or algorithms
# that have their own random number generators, so it's possible
# that setting the seed for numpy might not be enough in all cases.

# Set environment variables for deterministic behavior
os.environ['PYTHONHASHSEED'] = str(seed)
os.environ['TF_CUDNN_DETERMINISTIC'] = 'true'
os.environ['TF_DETERMINISTIC_OPS'] = 'true'

# Disable GPU non-determinism (if using GPU)
if torch.cuda.is_available():
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False