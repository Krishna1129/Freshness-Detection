# Freshness Detection

A web app that detects fresh vs rotten fruits and vegetables using object detection. Use a **live webcam** or **upload an image** to get bounding boxes and labels (e.g. fresh apple, rotten apple) with confidence scores. Built with Flask, OpenCV, and a Roboflow-hosted model.

## Features

- **Image detection** — Upload a photo; get an annotated image plus a clear text list of detections (class + confidence %) on the result page.
- **Live feed** — Real-time detection from your webcam (runs locally; not available when deployed to the cloud).
- **Roboflow model** — Uses the [Freshness Fruits and Vegetables](https://universe.roboflow.com/) dataset (YOLO-style model).
- **Deploy with Docker** — Dockerfile and optional `render.yaml` for one-click deploy on [Render](https://render.com).

## Quick start (local)

1. **Clone the repo**
   ```bash
   git clone https://github.com/Krishna1129/Freshness-Detection.git
   cd Freshness-Detection
   ```

2. **Create a virtual environment (recommended)**
   - Windows:
     ```bash
     python -m venv venv
     .\venv\Scripts\activate
     ```
   - macOS/Linux:
     ```bash
     python3 -m venv venv
     source venv/bin/activate
     ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the app**
   ```bash
   python app.py
   ```
   The app opens at **http://localhost:5000**. Use “Upload a test image” for image detection or “Open live monitor” for webcam (requires a camera).

## Usage

- **Home** — Choose “Upload a test image” (batch check) or “Open live monitor” (webcam).
- **Image detection** — Upload a JPG/PNG; you get an annotated image and a **Detection results** list on the right (e.g. “fresh apple — 52% confidence”, “rotten apple — 41% confidence”).
- **Live feed** — Stream from webcam with real-time bounding boxes and labels. Works only when running locally (no camera in the cloud).

## Environment variables

| Variable            | Description |
|---------------------|-------------|
| `ROBOFLOW_API_KEY`  | Your [Roboflow](https://roboflow.com) API key. Optional locally if the app has a default; **required** when deploying (e.g. on Render). |
| `PORT`              | Server port. Default `5000`; set by Render in production. |

## Deploy on Render (Docker)

1. In [Render](https://dashboard.render.com): **New → Web Service**.
2. Connect your GitHub repo (e.g. `Krishna1129/Freshness-Detection`).
3. Set **Environment** to **Docker** (Render will use the repo’s `Dockerfile`).
4. Add environment variable: **ROBOFLOW_API_KEY** = your Roboflow API key.
5. Deploy. Image upload and detection work; live webcam does not (no camera on Render).

Alternatively, use the **Blueprint**: push `render.yaml` and use **New → Blueprint**, then set **ROBOFLOW_API_KEY** in the service’s Environment tab.

## Project structure

```
Freshness-Detection/
├── app.py              # Flask app: routes, Roboflow prediction, image + live feed
├── requirements.txt    # Python dependencies (Flask, opencv, roboflow, gunicorn)
├── Dockerfile          # Container build for Render/other hosts
├── render.yaml         # Optional Render Blueprint
├── templates/
│   ├── index.html      # Home: choose image upload or live feed
│   ├── result.html     # Result: annotated image + text detection list
│   └── live_feed.html  # Live webcam view
└── static/
    └── uploads/        # Saved result images (created at runtime)
```

## Tech stack

- **Backend:** Flask, OpenCV (cv2)
- **Model:** Roboflow API (freshness-fruits-and-vegetables, version 7)
- **Frontend:** HTML + Tailwind CSS
- **Deploy:** Docker, Gunicorn; optional Render Blueprint

## License

Use and modify as needed. Model/data terms depend on Roboflow and the dataset source.
