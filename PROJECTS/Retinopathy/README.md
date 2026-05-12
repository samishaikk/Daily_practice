# 👁️ Diabetic Retinopathy Detection
### Binary Classification using Transfer Learning (EfficientNetB0)


---

## 📌 Project Overview

Diabetic Retinopathy (DR) is a diabetes-related eye disease that damages the blood vessels in the retina and is one of the leading causes of blindness worldwide. Early detection is critical — if caught in time, vision loss can be prevented or significantly slowed.

This project builds a deep learning model that analyzes retinal fundus images and classifies them as:
- **No DR** — No signs of diabetic retinopathy
- **Has DR** — Signs of diabetic retinopathy present

The model is designed to assist ophthalmologists as a screening tool, flagging high-risk patients for further examination.

---

## 📊 Results

| Metric | Score |
|---|---|
| Validation Accuracy | **97%** |
| Validation AUC | **99.66%** |
| F1-Score (No DR) | 0.97 |
| F1-Score (Has DR) | 0.97 |
| False Negatives | 7 / 372 DR cases |

The model correctly identified **98% of actual DR cases**, which is the most critical metric in a medical screening context — missing a DR case is far more dangerous than a false alarm.

---

## 🗂️ Dataset

- **Source:** [APTOS 2019 Blindness Detection — Kaggle](https://www.kaggle.com/competitions/aptos2019-blindness-detection)
- **Total Training Images:** ~3,662 retinal fundus images
- **Labels:** 5 severity grades (0–4), converted to binary (0 = No DR, 1 = Has DR)
- **Image Size:** Resized to 224×224 pixels

---

## 🏗️ Project Structure

```
Retinopathy/
├── aptos2019-blindness-detection/
│   ├── train_images/         # Retinal fundus images
│   ├── test_images/          # Test images
│   ├── train.csv             # Image IDs and severity labels
│   └── test.csv              # Test image IDs
├── blindness_detection.ipynb # Main notebook
├── retinopathy_model.h5      # Saved trained model
└── README.md
```

---

## 🔬 Methodology

### 1. Exploratory Data Analysis (EDA)
- Analyzed class distribution across 5 severity grades
- Visualized sample retinal images for each grade
- Identified class imbalance and addressed it using class weights

### 2. Preprocessing
- Converted 5-class labels to binary (No DR vs Has DR)
- Applied EfficientNetB0's built-in `preprocess_input` (scales pixel values to model's expected range)
- Applied data augmentation during training:
  - Horizontal flip
  - Vertical flip

### 3. Model Architecture
- **Base Model:** EfficientNetB0 pretrained on ImageNet (transfer learning)
- **Custom Head:**
  - GlobalAveragePooling2D
  - BatchNormalization
  - Dropout (0.4)
  - Dense (128, ReLU)
  - Dropout (0.3)
  - Dense (1, Sigmoid) — binary output
- **Top 20 layers unfrozen** for fine-tuning on retinal data

### 4. Training
- **Optimizer:** Adam (lr = 1e-4)
- **Loss:** Binary Crossentropy
- **Batch Size:** 16
- **Epochs:** 20 (early stopping triggered at epoch 9)
- **Callbacks:** EarlyStopping, ReduceLROnPlateau
- **Class Weights:** Applied to handle imbalance between No DR and Has DR samples

### 5. Evaluation
- Confusion Matrix
- Classification Report (Precision, Recall, F1)
- ROC Curve with AUC score

---

## 🧰 Tech Stack

| Tool | Purpose |
|---|---|
| Python 3.8+ | Programming language |
| TensorFlow / Keras | Model building and training |
| EfficientNetB0 | Pretrained base model |
| OpenCV (cv2) | Image loading and preprocessing |
| NumPy / Pandas | Data manipulation |
| Matplotlib / Seaborn | Visualization |
| Scikit-learn | Evaluation metrics |


---

## 💡 Key Learnings

- **Transfer learning** with EfficientNetB0 drastically reduces training time while achieving high accuracy on medical image datasets
- **Proper preprocessing matters** — using EfficientNet's own `preprocess_input` instead of manual rescaling was critical to model performance
- **Class weights** help the model treat both classes fairly when data is imbalanced
- In medical AI, **recall for the positive class (Has DR)** is more important than overall accuracy — missing a sick patient is worse than a false alarm
- **Early stopping** prevents overfitting and saves compute time on CPU

---

## ⚠️ Limitations

- Binary classification only — does not distinguish between severity grades (Mild, Moderate, Severe, Proliferative)
- Trained and tested on APTOS 2019 data — performance may vary on images from different cameras or hospitals
- Not intended for clinical deployment without further validation

---

## 🚀 Future Improvements

- Extend to multi-class classification (5 severity grades)
- Add Grad-CAM visualization to highlight regions the model focuses on
- Deploy as a web app using Streamlit or Flask
- Test on additional retinopathy datasets for generalization

---

## 👤 Author

**Sami**
- Built as part of an AI/ML portfolio project
- Dataset: APTOS 2019 Blindness Detection (Kaggle)

