import os.path

import onnx
import os

# Load the ONNX model
onnx_model_path = os.path.abspath('models/onnx/Phi-3-mini-128k-instruct-onnx/phi3-mini-128k-instruct-cpu-int4-rtn-block-32.onnx')

# Check the model
onnx.checker.check_model(onnx_model_path)
