import coremltools as ct

# Load your model (replace 'your_model.onnx' with your model file)
model = ct.models.MLModel('models/onnx/Phi-3-mini-128k-instruct-onnx/phi3-mini-128k-instruct-cpu-int4-rtn-block-32.onnx')

# Convert the model to CoreML format
coreml_model = ct.converters.onnx.convert(model)

# Save the CoreML model to a file
coreml_model.save('models/coreml/Phi-3-mini-128k.mlmodel')
