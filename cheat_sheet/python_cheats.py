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

def set_seed(seed):
    try:
        import random
        random.seed(seed)
    except ImportError:
        pass

    try:
        import numpy as np
        np.random.seed(seed)
    except ImportError:
        pass

    try:
        import tensorflow as tf
        tf.random.set_seed(seed)
    except ImportError:
        pass

    try:
        import torch
        torch.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)
    except ImportError:
        pass

    try:
        import sklearn
        sklearn.utils.check_random_state(seed)
    except ImportError:
        pass

    try:
        import os
        os.environ['PYTHONHASHSEED'] = str(seed)
        os.environ['TF_CUDNN_DETERMINISTIC'] = 'true'
        os.environ['TF_DETERMINISTIC_OPS'] = 'true'
    except ImportError:
        pass

    try:
        if torch.cuda.is_available():
            torch.backends.cudnn.deterministic = True
            torch.backends.cudnn.benchmark = False
    except ImportError:
        pass