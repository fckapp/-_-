import streamlit as st
import torch
import cv2
import numpy as np
from PIL import Image
from models.experimental import attempt_load
import torch
from torchvision import transforms

# 1. 모델 클래스 정의
class MyModel(torch.nn.Module):
    def __init__(self):
        super(MyModel, self).__init__()
        self.fc = torch.nn.Linear(10, 2)  # 입력 차원 10, 출력 차원 2

    def forward(self, x):
        return self.fc(x)

# 2. 모델 인스턴스 생성
model = MyModel()

# 3. 모델 로드 (CPU에서 로드)
torch.load('last50.pt')

# 4. 평가 모드로 전환 (예: dropout이나 batch normalization을 사용할 경우)
model.eval()

# 4. 이미지 전처리 함수 정의
def preprocess_image(image):
    transform = transforms.Compose([
        transforms.Resize((10, 10)),  # 모델의 입력 크기에 맞게 조정
        transforms.ToTensor()
    ])
    # 이미지 텐서를 10차원으로 변환
    image_tensor = transform(image).view(-1)  # 1D 텐서로 변환
    return image_tensor[:10].unsqueeze(0)  # 첫 10개 값만 사용하고 배치 차원 추가

# 5. Streamlit 인터페이스
st.title("불량품 예측 웹 애플리케이션")

# 이미지 업로드
uploaded_files = st.file_uploader("이미지를 업로드하세요", type=["jpg", "jpeg", "png"], accept_multiple_files=True)

if uploaded_files:
    results = []  # 결과를 저장할 리스트
    images = []  # 이미지와 파일 이름 저장

    for uploaded_file in uploaded_files:
        # 이미지 로드
        image = Image.open(uploaded_file)
        images.append((image, uploaded_file.name))

        # 이미지 전처리
        input_tensor = preprocess_image(image)

        # 모델에 입력 데이터를 통과시켜 예측 얻기
        with torch.no_grad():  # 그래디언트 계산 비활성화
            output = model(input_tensor)

        # 예측 결과 표시
        prediction = torch.argmax(output, dim=1).item()  # 예측된 클래스 인덱스
        result = "불량품" if prediction == 0 else "양품"
        results.append((uploaded_file.name, result))  # 결과 저장

    # 전체 이미지와 결과 표시
    cols = st.columns(len(images))  # 이미지 수만큼 열 생성
    for i, (img, file_name) in enumerate(images):
        with cols[i]:  # 각 열에 이미지 표시
            st.image(img, caption=f'업로드된 이미지: {file_name}', use_column_width=True)

    st.write("예측 결과:")
    for file_name, result in results:
        st.write(f"{file_name}: {result}")
