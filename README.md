# Freshness Detection for QuickCommerce

This project provides an automated solution to quickly detect and filter out rotten fruits and vegetables at the warehouse level for QuickCommerce platforms. It leverages object detection models to ensure that only fresh products are delivered to customers, preventing the delivery of spoiled or subpar produce. While the current system does not cover all types of fruits and vegetables, it can be expanded with more data and models to enhance accuracy and effectiveness.

The system is designed for quick quality checks using a YOLO model, and it provides two modes of detection:

- **Live Feed Detection**: Detects freshness via a real-time video stream from a webcam.
- **Image Detection**: Detects freshness from uploaded images.

Publicly available data from Roboflow has been used for model training and refinement, as collecting large datasets at the small-scale level was not feasible initially.

## Features
- **Real-Time Detection**: Use live webcam feed to detect rotten products in real-time.
- **Image Detection**: Upload images to quickly detect rotten fruits or vegetables.
- **YOLO Model**: Leverages YOLOv8 model for object detection.
- **Scalable**: Can be expanded to include more types of produce and different detection models.
- **Customizable**: Allows for fine-tuning and deployment of different models for higher accuracy.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Utkarsh-Shivhare/Freshness_detection.git
   cd Freshness_Detection
   ```

2. Set up a virtual environment (optional but recommended):
   - On macOS/Linux:
     ```bash
     python3 -m venv venv
     source venv/bin/activate
     ```
   - On Windows:
     ```bash
     python -m venv venv
     .\venv\Scripts\activate
     ```

3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. **Run the Application**: Start the Flask server by running:
   ```bash
   python app.py
   ```
   The server will start at [http://localhost:5000/](http://localhost:5000/). Open this link in your browser.

## Usage

### Live Feed Detection

1. Run the following command:
   ```bash
   python FreshnessDetection_live.py
   ```
2. Open your browser and navigate to `http://localhost:5000/`.
3. Click on "Start Live Feed Detection" to see real-time results.
4. Press 'q' to quit the live feed.

### Image Detection

1. Run the following command:
   ```bash
   python FreshnessDetection_image.py
   ```
2. Open your browser and navigate to `http://localhost:5000/`.
3. Upload an image of the produce.
4. The system will display the image with bounding boxes and labels for detected objects.

## Functionality Overview

- **FreshnessDetection_live.py**: Handles real-time detection using webcam feed.
- **FreshnessDetection_image.py**: Processes uploaded images for freshness detection.

## Data and Model

- Uses YOLOv8, a state-of-the-art deep learning model for real-time object detection.
- Utilizes publicly available data from Roboflow for initial training.
- Can be expanded with more data to improve accuracy and coverage of different produce types.

## Future Enhancements

- Expand the dataset to include more fruits and vegetables.
- Implement real-time data capture for model refinement.
- Integrate a dashboard for visualizing detection results and generating reports.
- Experiment with different models or custom-trained models for improved accuracy.

## Conclusion

This application provides a quick and effective way to ensure the freshness of products delivered to customers. By using YOLO for real-time object detection, it helps reduce errors in delivering rotten produce and improves customer satisfaction for QuickCommerce platforms.

Feel free to contribute by expanding the dataset, refining the model, or adding new features to this application!