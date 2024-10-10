import streamlit as st
import torch
import cv2
import numpy as np
from PIL import Image
import torch
from torchvision import transforms

# 페이지
st.set_page_config(
    page_title="불량품 예측 프로그램",
    page_icon="📈"
)

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
# torch.load('last100.pt')
############ chat gpt
# 가중치 파일 로드
checkpoint = torch.load('last100.pt', map_location=torch.device('cpu'))

# 모델의 가중치만 로드
model.load_state_dict(checkpoint['model'], strict=False)  # strict=False로 키 일치 여부 무시

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
st.title("📈 불량품 예측 웹 애플리케이션")

# style 입히기
st.markdown('''
    <style>
            .stMarkdown p{
                font-size: 20px;
            }
            .e1nzilvr3{
                display: flex;
                justify-content: center;
            }
            .e1nzilvr5{
                display: flex;
                justify-content: center;
            }
    </style>
''', unsafe_allow_html=True)

# 이미지 업로드
results = []  # 결과를 저장할 리스트
images = []  # 이미지와 파일 이름 저장

st.info("예측하고 싶은 이미지를 업로드하세요")
uploaded_files = st.file_uploader(
    "여러 개 선택 가능 합니다.", type=["jpg", "jpeg", "png"], accept_multiple_files=True)

if uploaded_files:
    for uploaded_file in uploaded_files:
        # 이미지 로드
        image = Image.open(uploaded_file)
        images.append((image, uploaded_file.name))

# 예측 확인 버튼
if st.button("예측 확인", use_container_width=True, key="predict_button"):
    for img, file_name in images:
        # 이미지 전처리
        input_tensor = preprocess_image(img)

        # 모델에 입력 데이터를 통과시켜 예측 얻기
        with torch.no_grad():  # 그래디언트 계산 비활성화
            output = model(input_tensor)

        # 예측 결과 표시
        prediction = torch.argmax(output, dim=1).item()  # 예측된 클래스 인덱스
        result = "불량품" if prediction == 0 else "양품"
        # st.write(f'디버깅>> prediction은 {prediction}')
        results.append((file_name, result))  # 결과 저장

    # st.write(f'디버깅>> {results}')
    # 모든 이미지와 결과를 스크롤 가능한 형식으로 표시
    st.subheader("모든 이미지 및 예측 결과")
    # 전체 이미지와 결과 표시
    cols = st.columns(3)
    for i, (img, file_name) in enumerate(images):
        with cols[i % 3]:
            st.image(
                img, caption=f'업로드된 이미지: {file_name}', use_column_width=True)
            # st.write(results) # 디버깅
            st.write(f"예측 결과: {results[i][1]}")  # 각 이미지에 대한 예측 결과 표시
