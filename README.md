# Dog vs Cat Image Classifier

A machine learning application that uses MobileNetV2 to classify whether an image contains a dog or a cat. Simply provide an image URL and get instant, accurate predictions!

## Demo

<p align="center">
  <img src="https://github.com/user-attachments/assets/c62ca96b-1fe4-44f6-b22a-15cd6b02faff" height="400"/>
  &nbsp;&nbsp;&nbsp; 
     <img src="https://github.com/user-attachments/assets/98ae754c-236c-4836-8ddd-c9a27af2c56b" height="400"/>
  &nbsp;&nbsp;&nbsp; 
   <img src="https://github.com/user-attachments/assets/5a3a0d1d-88e2-4744-a3ca-7fa6432dde2f" height="400"/>
</p> 

## Features

- **Powered by MobileNetV2**: Utilizes Google's efficient and powerful deep learning model
- **URL-based Input**: Easy image classification using web URLs
- **Real-time Predictions**: Get instant results with confidence scores
- **Image Preprocessing**: Automatic resizing and normalization for optimal model performance
- **Visual Display**: Shows the input image alongside prediction results

## How It Works

1. **Input**: Enter an image URL when prompted
2. **Download**: The app fetches the image from the provided URL
3. **Preprocessing**: 
   - Converts grayscale images to RGB
   - Handles RGBA images by removing alpha channel
   - Resizes image to 224x224 pixels (MobileNetV2 input requirement)
   - Normalizes pixel values to 0-1 range
4. **Prediction**: Processes the image through the trained MobileNetV2 model
5. **Output**: Displays the image and classification result (Cat or Dog)

## Requirements

```python
numpy
PIL (Pillow)
matplotlib
scikit-learn
requests
opencv-python (cv2)
```

## Usage

1. Run the script
2. When prompted, enter the URL of an image containing a cat or dog
3. The app will display the image and print the classification result
4. View the prediction confidence scores in the output

## Model Details

- **Architecture**: MobileNetV2
- **Input Size**: 224x224x3 (RGB images)
- **Classes**: 
  - Class 0: Cat
  - Class 1: Dog
- **Output**: Binary classification with confidence scores

## Example Output

```
Enter the URL of the image to be predicted: https://example.com/cute-cat.jpg
[[0.85 0.15]]
The image represents a Cat
```

## Image Format Support

- **RGB Images**: Processed directly
- **Grayscale Images**: Automatically converted to RGB
- **RGBA Images**: Alpha channel removed, converted to RGB
- **Supported Formats**: Any format supported by PIL (JPEG, PNG, GIF, etc.)

## Note

This is a simplified version of the full application. Make sure you have a trained MobileNetV2 model loaded as `model` before running the prediction code.

## Future Enhancements

- Support for local image files
- Batch processing for multiple images
- Additional animal classes
- Web interface for easier use
- Model confidence threshold settings
